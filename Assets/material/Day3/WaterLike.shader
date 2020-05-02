Shader "Custom/water"
{
	//ここに書くとインスペクタから指定できるようになる
	Properties{
		_MainTex("Water Texture",2D)="white"{}
	}
    SubShader
    {
		Tags { "Queue" = "Transparent" }
        //Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

		sampler2D _MainTex;

        struct Input
        {
			float2 uv_MainTex;
        };
		//1ピクセルごとにこのメソッドが実行される
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed2 uv = IN.uv_MainTex;
			uv.x += 0.2*_Time;
			uv.y += 0.4*_Time;
			fixed4 c= tex2D(_MainTex, uv);
			o.Albedo = c;
			o.Alpha = (c.r*0.3 + c.g*0.6 + c.b*0.1 < 0.2) ? 1 : 0.7;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
