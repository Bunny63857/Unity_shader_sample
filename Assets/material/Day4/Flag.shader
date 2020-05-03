Shader "Custom/VertexShader"
{
	
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
		//Unityに頂点シェーダーを作成することを伝える
        #pragma surface surf Lambert vertex:vert
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
			float4 vertColor;
        };

		//appdata_full型のcolor変数から頂点カラーの情報を取り出してinputに入れる
		void vert(inout appdata_full v,out Input o) {
			UNITY_INITIALIZE_OUTPUT(Input, o);
			o.vertColor = v.color;
		}

        void surf (Input IN, inout SurfaceOutput o)
        {
			o.Albedo = IN.vertColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
