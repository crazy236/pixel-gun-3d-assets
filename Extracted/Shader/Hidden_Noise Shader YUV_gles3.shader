//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Noise Shader YUV" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_GrainTex ("Base (RGB)", 2D) = "gray" { }
_ScratchTex ("Base (RGB)", 2D) = "gray" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 51747
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GrainOffsetScale;
uniform 	vec4 _ScratchOffsetScale;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _GrainOffsetScale.zw + _GrainOffsetScale.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _ScratchOffsetScale.zw + _ScratchOffsetScale.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Intensity;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _GrainTex;
uniform mediump sampler2D _ScratchTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0.xyz = texture(_GrainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xy = u_xlat16_1.zx + (-u_xlat16_2.xx);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_2.yz = u_xlat16_3.xy * vec2(0.492000014, 0.876999974);
    u_xlat16_2.xyz = u_xlat16_0.xyz * _Intensity.xxx + u_xlat16_2.xyz;
    u_xlat16_14 = dot(u_xlat16_2.zy, vec2(-0.58099997, -0.395000011));
    u_xlat16_3.y = u_xlat16_2.x + u_xlat16_14;
    u_xlat16_3.xz = u_xlat16_2.zy * vec2(1.13999999, 2.03200006) + u_xlat16_2.xx;
    u_xlat16_0.xyz = texture(_ScratchTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    SV_Target0.xyz = u_xlat16_0.xyz * _Intensity.yyy + u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GrainOffsetScale;
uniform 	vec4 _ScratchOffsetScale;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _GrainOffsetScale.zw + _GrainOffsetScale.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _ScratchOffsetScale.zw + _ScratchOffsetScale.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Intensity;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _GrainTex;
uniform mediump sampler2D _ScratchTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0.xyz = texture(_GrainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xy = u_xlat16_1.zx + (-u_xlat16_2.xx);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_2.yz = u_xlat16_3.xy * vec2(0.492000014, 0.876999974);
    u_xlat16_2.xyz = u_xlat16_0.xyz * _Intensity.xxx + u_xlat16_2.xyz;
    u_xlat16_14 = dot(u_xlat16_2.zy, vec2(-0.58099997, -0.395000011));
    u_xlat16_3.y = u_xlat16_2.x + u_xlat16_14;
    u_xlat16_3.xz = u_xlat16_2.zy * vec2(1.13999999, 2.03200006) + u_xlat16_2.xx;
    u_xlat16_0.xyz = texture(_ScratchTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    SV_Target0.xyz = u_xlat16_0.xyz * _Intensity.yyy + u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GrainOffsetScale;
uniform 	vec4 _ScratchOffsetScale;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _GrainOffsetScale.zw + _GrainOffsetScale.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _ScratchOffsetScale.zw + _ScratchOffsetScale.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Intensity;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _GrainTex;
uniform mediump sampler2D _ScratchTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0.xyz = texture(_GrainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xy = u_xlat16_1.zx + (-u_xlat16_2.xx);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_2.yz = u_xlat16_3.xy * vec2(0.492000014, 0.876999974);
    u_xlat16_2.xyz = u_xlat16_0.xyz * _Intensity.xxx + u_xlat16_2.xyz;
    u_xlat16_14 = dot(u_xlat16_2.zy, vec2(-0.58099997, -0.395000011));
    u_xlat16_3.y = u_xlat16_2.x + u_xlat16_14;
    u_xlat16_3.xz = u_xlat16_2.zy * vec2(1.13999999, 2.03200006) + u_xlat16_2.xx;
    u_xlat16_0.xyz = texture(_ScratchTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    SV_Target0.xyz = u_xlat16_0.xyz * _Intensity.yyy + u_xlat16_3.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
}
}
}
}