//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Instanced/TextureChanger" {
Properties {
_MainTex ("Albedo (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 48611
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD2.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat8;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat16_0.xyz = texture2D(unity_Lightmap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD2.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD2.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD2.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD2.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD2.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD2.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = log2(u_xlat16_3.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlatb0.x = vs_COLOR0.x<0.100000001;
    if(u_xlatb0.x){
        u_xlat0.xy = floor(vs_TEXCOORD0.xy);
        u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
        u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
        u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
        u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
        u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
        u_xlat16_1.xyz = u_xlat10_0.xyz;
    } else {
        u_xlatb0.x = vs_COLOR0.x<0.300000012;
        if(u_xlatb0.x){
            u_xlat0.xy = floor(vs_TEXCOORD0.xy);
            u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
            u_xlatb0.x = abs(u_xlat0.x)<0.5;
            u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
            u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
            u_xlatb0.x = 0.5<abs(u_xlat0.y);
            u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
            u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
            u_xlat16_1.xyz = u_xlat10_0.xyz;
        } else {
            u_xlatb0.x = vs_COLOR0.x<0.600000024;
            if(u_xlatb0.x){
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.x = 0.5<abs(u_xlat0.x);
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat2.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlatb0.x = abs(u_xlat0.y)<0.5;
                u_xlat2.y = (u_xlatb0.x) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            } else {
                u_xlat0.xy = floor(vs_TEXCOORD0.xy);
                u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD0.xy);
                u_xlatb0.xy = lessThan(abs(u_xlat0.xyxx), vec4(0.5, 0.5, 0.0, 0.0)).xy;
                u_xlat8.xy = vs_TEXCOORD0.xy + vec2(0.5, 0.5);
                u_xlat0.x = (u_xlatb0.x) ? u_xlat8.x : vs_TEXCOORD0.x;
                u_xlat0.y = (u_xlatb0.y) ? u_xlat8.y : vs_TEXCOORD0.y;
                u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
                u_xlat16_1.xyz = u_xlat10_0.xyz;
            //ENDIF
            }
        //ENDIF
        }
    //ENDIF
    }
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat12 = vs_TEXCOORD2.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
}
Fallback "Diffuse"
}