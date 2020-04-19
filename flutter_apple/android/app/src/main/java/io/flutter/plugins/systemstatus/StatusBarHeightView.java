package io.flutter.plugins.systemstatus;

/**
 * <p>文件描述：<p>
 * <p>作者：apple_hsp<p>
 * <p>创建时间：2019/1/9<p>
 * <p>更改时间：2019/1/9<p>
 * <p>版本号：1<p>
 */

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.LinearLayout;

import com.flutter.apple.app.R;


/**
 * 作者:applehsp
 * 功能:状态栏高度View,用于沉浸占位
 */
@SuppressLint("NewApi")
public class StatusBarHeightView extends LinearLayout {
  private int statusBarHeight;
  private int type;

  public StatusBarHeightView(Context context, AttributeSet attrs) {
    super(context, attrs);
    init(attrs);
  }

  public StatusBarHeightView(Context context, AttributeSet attrs, int defStyleAttr) {
    super(context, attrs, defStyleAttr);
    init(attrs);
  }

  public StatusBarHeightView(Context context,AttributeSet attrs, int defStyleAttr, int defStyleRes) {
    super(context, attrs, defStyleAttr);
    init(attrs);
  }

  private void init(AttributeSet attrs) {
    int resourceId = getResources().getIdentifier("status_bar_height", "dimen", "android");
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
      if (resourceId > 0) {
        statusBarHeight = getResources().getDimensionPixelSize(resourceId);
      }
    } else {
      //低版本 直接设置0
      statusBarHeight = 0;
    }

    if (type == 1) {
      setPadding(getPaddingLeft(), statusBarHeight, getPaddingRight(), getPaddingBottom());
    }
  }

  @Override
  protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
    if (type == 0) {
      setMeasuredDimension(getDefaultSize(getSuggestedMinimumWidth(), widthMeasureSpec),
        statusBarHeight);
    } else {
      super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
  }

}
