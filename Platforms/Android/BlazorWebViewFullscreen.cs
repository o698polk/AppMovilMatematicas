#if ANDROID
using Android.App;
using Android.Content.PM;
using Android.Views;
using Android.Webkit;
using Android.Widget;
using AView = Android.Views.View;
using AWebView = Android.Webkit.WebView;

namespace MauiApp2.Platforms.Android;

/// <summary>
/// WebChromeClient que permite fullscreen nativo de iframes (YouTube/juegos).
/// </summary>
public sealed class FullscreenWebChromeClient(Activity activity, WebChromeClient? inner) : WebChromeClient
{
    private AView? _customView;
    private ICustomViewCallback? _callback;
    private FrameLayout? _container;
    private ScreenOrientation _orientacionPrevia;

    public static void Attach(AWebView webView, Activity activity)
    {
        var existing = webView.WebChromeClient;
        webView.SetWebChromeClient(new FullscreenWebChromeClient(activity, existing));
    }

    public override void OnShowCustomView(AView? view, ICustomViewCallback? callback)
    {
        if (view is null || callback is null) return;

        if (_customView is not null)
        {
            OnHideCustomView();
            return;
        }

        _customView = view;
        _callback = callback;
        _orientacionPrevia = activity.RequestedOrientation;

        var decor = (ViewGroup)activity.Window!.DecorView;
        _container = new FrameLayout(activity);
        _container.SetBackgroundColor(global::Android.Graphics.Color.Black);
        _container.AddView(view, new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MatchParent,
            ViewGroup.LayoutParams.MatchParent));
        decor.AddView(_container, new ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MatchParent,
            ViewGroup.LayoutParams.MatchParent));

        activity.RequestedOrientation = ScreenOrientation.Sensor;
        activity.Window.AddFlags(WindowManagerFlags.Fullscreen);
    }

    public override void OnHideCustomView()
    {
        if (_customView is null) return;

        var decor = (ViewGroup)activity.Window!.DecorView;
        if (_container is not null)
        {
            _container.RemoveAllViews();
            decor.RemoveView(_container);
        }

        _customView = null;
        _container = null;
        _callback?.OnCustomViewHidden();
        _callback = null;

        activity.Window.ClearFlags(WindowManagerFlags.Fullscreen);
        activity.RequestedOrientation = _orientacionPrevia;
    }

    public override bool OnConsoleMessage(ConsoleMessage? consoleMessage)
        => inner?.OnConsoleMessage(consoleMessage) ?? base.OnConsoleMessage(consoleMessage);

    public override void OnProgressChanged(AWebView? view, int newProgress)
        => inner?.OnProgressChanged(view, newProgress);

    public override void OnReceivedTitle(AWebView? view, string? title)
        => inner?.OnReceivedTitle(view, title);

    public override bool OnJsAlert(AWebView? view, string? url, string? message, JsResult? result)
        => inner?.OnJsAlert(view, url, message, result) ?? base.OnJsAlert(view, url, message, result);

    public override bool OnJsConfirm(AWebView? view, string? url, string? message, JsResult? result)
        => inner?.OnJsConfirm(view, url, message, result) ?? base.OnJsConfirm(view, url, message, result);

    public override bool OnShowFileChooser(AWebView? webView, IValueCallback? filePathCallback, FileChooserParams? fileChooserParams)
        => inner?.OnShowFileChooser(webView, filePathCallback, fileChooserParams)
           ?? base.OnShowFileChooser(webView, filePathCallback, fileChooserParams);
}
#endif
