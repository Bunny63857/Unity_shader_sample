Shader "Custom/DrawTexture"
{
	//ここに書くとインスペクタから指定できるようになる
	Properties{
		_MainTex("Texture",2D)="white"{}
	}
    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0
        struct Input
        {
			float2 uv_MainTex;
        };
		sampler2D _MainTex;
		//1ピクセルごとにこのメソッドが実行される
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			//グレースケールの値を透明度に設定
			o.Alpha = (c.r*0.3 + c.g*0.6 + c.b*0.1<0.2) ? 1 : 0.5;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
