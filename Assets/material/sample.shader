Shader "Custom/sample"
{
	SubShader{
	CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0
	struct Input {
		float2 uv_MainTex;
	};
	fixed4 _BaseColor;
	void surf(Input IN, inout SurfaceOutputStandard o) {
		o.Albedo = _BaseColor.rgb;
	}
	ENDCG
    }
}
