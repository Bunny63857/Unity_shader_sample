Shader "Custom/transparent"
{
	//ここに書くとインスペクタから指定できるようになる
	Properties{
		_BaseColor("Base Color",Color) = (1,1,1,1)
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
			//法線ベクトル
			float3 worldNormal;
			//視線方向
			float3 viewDir;
        };
		fixed4 _BaseColor;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _BaseColor.rgb;
            o.Alpha = 0.5;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
