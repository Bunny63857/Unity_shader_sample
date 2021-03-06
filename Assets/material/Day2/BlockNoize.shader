﻿Shader "Custom/RandomNoize"
{
	//ここに書くとインスペクタから指定できるようになる
	Properties{
		_MainTex("Albedo (RGB)",2D)="white"{}
	}
		SubShader
	{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0
		sampler2D _MainTex;
		struct Input
        {
			float2 uv_MainTex;
        };

		float random(fixed2 p) {
			return frac(sin(dot( p , fixed2(12.9898,78.233 ) ))*43758.5453*floor(_Time*100));
		}
		float noize(fixed2 st) {
			//floor関数:少数値の整数部分を返す
			fixed2 p = floor(st);
			return random(p);
		}

		//1ピクセルごとにこのメソッドが実行される
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			float c = noize(IN.uv_MainTex * 8)*clamp(random(floor(_Time*3)),0.5,1);
			o.Albedo = fixed4(c, c, c, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
