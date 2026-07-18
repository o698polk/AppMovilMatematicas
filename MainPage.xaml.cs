using Microsoft.AspNetCore.Components.WebView;

namespace MauiApp2;

public partial class MainPage : ContentPage
{
    public MainPage()
    {
        InitializeComponent();
        blazorWebView.BlazorWebViewInitialized += OnBlazorWebViewInitialized;
    }

    private void OnBlazorWebViewInitialized(object? sender, BlazorWebViewInitializedEventArgs e)
    {
#if ANDROID
        if (Platform.CurrentActivity is not null)
            Platforms.Android.FullscreenWebChromeClient.Attach(e.WebView, Platform.CurrentActivity);
#endif
    }
}
