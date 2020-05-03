Shader "Custom/FlagShader"
{
	Properties{
		_MainTex("Albedo(RGB)",2D) = "white"{}
	}
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
			float2 uv_MainTex;
        };
		float random(fixed2 p) {
			return frac(sin(dot(p, fixed2(12.9898, 78.233)))*43758.5453*floor(_Time * 100));
		}
		float noize(fixed2 st) {
			//floor関数:少数値の整数部分を返す
			fixed2 p = floor(st);
			return random(p);
		}

		//appdata_full型のcolor変数から頂点カラーの情報を取り出してinputに入れる
		void vert(inout appdata_full v,out Input o) {
			UNITY_INITIALIZE_OUTPUT(Input, o);
			float amp = 0.7*sin(_Time * 150 + v.vertex.x * 100);
			v.vertex.xyz = float3(v.vertex.x, v.vertex.y + amp, v.vertex.z);
		}

        void surf (Input IN, inout SurfaceOutput o)
        {
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			//o.Albedo = c.rgb;
			float q = noize(IN.uv_MainTex * 8)*clamp(random(floor(_Time * 3)), 0.5, 1);
			o.Albedo = fixed4(q, q, q, 1);
			o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
