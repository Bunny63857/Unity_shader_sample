Shader "Custom/transparent"
{
	//ここに書くとインスペクタから指定できるようになる
	Properties{
		_BaseColor("Base Color",Color) = (1,1,1,1)
	}
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard 
        #pragma target 3.0
        struct Input
        {
			float2 uv_MainTex;
			//法線ベクトル
			float3 worldNormal;
			//視線方向
			float3 viewDir;
        };
		fixed4 _BaseColor;
		//
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed4 baseColor = fixed4(0.05, 0.1, 0, 1);
			fixed4 rimColor = fixed4(0.5, 0.7, 0.5, 1);

            o.Albedo = baseColor;
			//dot関数：内積，saturate関数：0~1にクランプ
			float rim = 1 - saturate(dot(IN.viewDir, o.Normal));
			//pow関数：xをy乗する
			o.Emission = rimColor * pow(rim, 3);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
