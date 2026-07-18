package crc6473cf9c6b5d73ccb8;


public class FullscreenWebChromeClient
	extends android.webkit.WebChromeClient
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onShowCustomView:(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V:GetOnShowCustomView_Landroid_view_View_Landroid_webkit_WebChromeClient_CustomViewCallback_Handler\n" +
			"n_onHideCustomView:()V:GetOnHideCustomViewHandler\n" +
			"n_onConsoleMessage:(Landroid/webkit/ConsoleMessage;)Z:GetOnConsoleMessage_Landroid_webkit_ConsoleMessage_Handler\n" +
			"n_onProgressChanged:(Landroid/webkit/WebView;I)V:GetOnProgressChanged_Landroid_webkit_WebView_IHandler\n" +
			"n_onReceivedTitle:(Landroid/webkit/WebView;Ljava/lang/String;)V:GetOnReceivedTitle_Landroid_webkit_WebView_Ljava_lang_String_Handler\n" +
			"n_onJsAlert:(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z:GetOnJsAlert_Landroid_webkit_WebView_Ljava_lang_String_Ljava_lang_String_Landroid_webkit_JsResult_Handler\n" +
			"n_onJsConfirm:(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z:GetOnJsConfirm_Landroid_webkit_WebView_Ljava_lang_String_Ljava_lang_String_Landroid_webkit_JsResult_Handler\n" +
			"n_onShowFileChooser:(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z:GetOnShowFileChooser_Landroid_webkit_WebView_Landroid_webkit_ValueCallback_Landroid_webkit_WebChromeClient_FileChooserParams_Handler\n" +
			"";
		mono.android.Runtime.register ("MauiApp2.Platforms.Android.FullscreenWebChromeClient, MauiApp2", FullscreenWebChromeClient.class, __md_methods);
	}

	public FullscreenWebChromeClient ()
	{
		super ();
		if (getClass () == FullscreenWebChromeClient.class) {
			mono.android.TypeManager.Activate ("MauiApp2.Platforms.Android.FullscreenWebChromeClient, MauiApp2", "", this, new java.lang.Object[] {  });
		}
	}

	public FullscreenWebChromeClient (android.app.Activity p0, android.webkit.WebChromeClient p1)
	{
		super ();
		if (getClass () == FullscreenWebChromeClient.class) {
			mono.android.TypeManager.Activate ("MauiApp2.Platforms.Android.FullscreenWebChromeClient, MauiApp2", "Android.App.Activity, Mono.Android:Android.Webkit.WebChromeClient, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}

	public void onShowCustomView (android.view.View p0, android.webkit.WebChromeClient.CustomViewCallback p1)
	{
		n_onShowCustomView (p0, p1);
	}

	private native void n_onShowCustomView (android.view.View p0, android.webkit.WebChromeClient.CustomViewCallback p1);

	public void onHideCustomView ()
	{
		n_onHideCustomView ();
	}

	private native void n_onHideCustomView ();

	public boolean onConsoleMessage (android.webkit.ConsoleMessage p0)
	{
		return n_onConsoleMessage (p0);
	}

	private native boolean n_onConsoleMessage (android.webkit.ConsoleMessage p0);

	public void onProgressChanged (android.webkit.WebView p0, int p1)
	{
		n_onProgressChanged (p0, p1);
	}

	private native void n_onProgressChanged (android.webkit.WebView p0, int p1);

	public void onReceivedTitle (android.webkit.WebView p0, java.lang.String p1)
	{
		n_onReceivedTitle (p0, p1);
	}

	private native void n_onReceivedTitle (android.webkit.WebView p0, java.lang.String p1);

	public boolean onJsAlert (android.webkit.WebView p0, java.lang.String p1, java.lang.String p2, android.webkit.JsResult p3)
	{
		return n_onJsAlert (p0, p1, p2, p3);
	}

	private native boolean n_onJsAlert (android.webkit.WebView p0, java.lang.String p1, java.lang.String p2, android.webkit.JsResult p3);

	public boolean onJsConfirm (android.webkit.WebView p0, java.lang.String p1, java.lang.String p2, android.webkit.JsResult p3)
	{
		return n_onJsConfirm (p0, p1, p2, p3);
	}

	private native boolean n_onJsConfirm (android.webkit.WebView p0, java.lang.String p1, java.lang.String p2, android.webkit.JsResult p3);

	public boolean onShowFileChooser (android.webkit.WebView p0, android.webkit.ValueCallback p1, android.webkit.WebChromeClient.FileChooserParams p2)
	{
		return n_onShowFileChooser (p0, p1, p2);
	}

	private native boolean n_onShowFileChooser (android.webkit.WebView p0, android.webkit.ValueCallback p1, android.webkit.WebChromeClient.FileChooserParams p2);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
