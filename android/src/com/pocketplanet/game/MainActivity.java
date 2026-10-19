package com.pocketplanet.game;
import android.app.Activity;
import android.os.Bundle;
import android.webkit.*;
public class MainActivity extends Activity {
 private WebView web;
 @Override public void onCreate(Bundle state){super.onCreate(state);web=new WebView(this);setContentView(web);web.setBackgroundColor(0xfffaf5ed);web.getSettings().setJavaScriptEnabled(true);web.getSettings().setDomStorageEnabled(true);web.getSettings().setAllowFileAccess(true);web.getSettings().setAllowContentAccess(false);web.setWebChromeClient(new WebChromeClient());web.setWebViewClient(new WebViewClient(){@Override public boolean shouldOverrideUrlLoading(WebView v,WebResourceRequest r){return true;}});web.loadUrl("file:///android_asset/index.html");}
 @Override protected void onPause(){super.onPause();web.onPause();}
 @Override protected void onResume(){super.onResume();if(web!=null)web.onResume();}
 @Override public void onBackPressed(){new android.app.AlertDialog.Builder(this).setMessage("退出口袋星球？进度已自动保存。").setPositiveButton("退出",new android.content.DialogInterface.OnClickListener(){public void onClick(android.content.DialogInterface d,int w){finish();}}).setNegativeButton("继续陪伴",null).show();}
}
