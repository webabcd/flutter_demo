/**
 * 本例的 view 用于显示在 flutter 中
 */

package com.example.flutter_demo

import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.FrameLayout
import android.widget.TextView

class MyView(context: Context, attrs: AttributeSet?) : FrameLayout(context, attrs) {

    private var textView: TextView? = null
    private var onAndroidToFlutterHandler: OnAndroidToFlutterHandler? = null

    init {
        val rootView = LayoutInflater.from(context).inflate(R.layout.view_my, this, true)
        initView(rootView)
    }

    private fun initView(rootView: View) {
        textView = rootView.findViewById(R.id.textView)
        rootView.findViewById<Button>(R.id.button).setOnClickListener {
            // 用于从 android 发送数据到 flutter
            onAndroidToFlutterHandler?.onAndroidToFlutter("${System.currentTimeMillis()}")
        }
    }

    fun setOnAndroidToFlutterHandler(handler: OnAndroidToFlutterHandler?) {
        onAndroidToFlutterHandler = handler
    }

    // 用于显示 flutter 发送到 android 的数据
    fun showMessage(message: String) {
        textView?.text = message
    }
}

interface OnAndroidToFlutterHandler {
    fun onAndroidToFlutter(message: String)
}