// This file is generated from text files from GLEW.
// See copyright in src/lib/gl/gl.d (BSD/MIT like).
module lib.gl.core.gl14;

import lib.gl.types;


bool GL_VERSION_1_4;

const GL_GENERATE_MIPMAP = 0x8191;
const GL_GENERATE_MIPMAP_HINT = 0x8192;
const GL_DEPTH_COMPONENT16 = 0x81A5;
const GL_DEPTH_COMPONENT24 = 0x81A6;
const GL_DEPTH_COMPONENT32 = 0x81A7;
const GL_TEXTURE_DEPTH_SIZE = 0x884A;
const GL_DEPTH_TEXTURE_MODE = 0x884B;
const GL_TEXTURE_COMPARE_MODE = 0x884C;
const GL_TEXTURE_COMPARE_FUNC = 0x884D;
const GL_COMPARE_R_TO_TEXTURE = 0x884E;
const GL_FOG_COORDINATE_SOURCE = 0x8450;
const GL_FOG_COORDINATE = 0x8451;
const GL_FRAGMENT_DEPTH = 0x8452;
const GL_CURRENT_FOG_COORDINATE = 0x8453;
const GL_FOG_COORDINATE_ARRAY_TYPE = 0x8454;
const GL_FOG_COORDINATE_ARRAY_STRIDE = 0x8455;
const GL_FOG_COORDINATE_ARRAY_POINTER = 0x8456;
const GL_FOG_COORDINATE_ARRAY = 0x8457;
const GL_POINT_SIZE_MIN = 0x8126;
const GL_POINT_SIZE_MAX = 0x8127;
const GL_POINT_FADE_THRESHOLD_SIZE = 0x8128;
const GL_POINT_DISTANCE_ATTENUATION = 0x8129;
const GL_COLOR_SUM = 0x8458;
const GL_CURRENT_SECONDARY_COLOR = 0x8459;
const GL_SECONDARY_COLOR_ARRAY_SIZE = 0x845A;
const GL_SECONDARY_COLOR_ARRAY_TYPE = 0x845B;
const GL_SECONDARY_COLOR_ARRAY_STRIDE = 0x845C;
const GL_SECONDARY_COLOR_ARRAY_POINTER = 0x845D;
const GL_SECONDARY_COLOR_ARRAY = 0x845E;
const GL_BLEND_DST_RGB = 0x80C8;
const GL_BLEND_SRC_RGB = 0x80C9;
const GL_BLEND_DST_ALPHA = 0x80CA;
const GL_BLEND_SRC_ALPHA = 0x80CB;
const GL_INCR_WRAP = 0x8507;
const GL_DECR_WRAP = 0x8508;
const GL_TEXTURE_FILTER_CONTROL = 0x8500;
const GL_TEXTURE_LOD_BIAS = 0x8501;
const GL_MAX_TEXTURE_LOD_BIAS = 0x84FD;
const GL_MIRRORED_REPEAT = 0x8370;

extern(System):

void (*glBlendEquation)(GLenum mode);
void (*glBlendColor)(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
void (*glFogCoordf)(GLfloat coord);
void (*glFogCoordfv)(GLfloat *coord);
void (*glFogCoordd)(GLdouble coord);
void (*glFogCoorddv)(GLdouble *coord);
void (*glFogCoordPointer)(GLenum type, GLsizei stride, GLvoid *pointer);
void (*glMultiDrawArrays)(GLenum mode, GLint *first, GLsizei *count, GLsizei primcount);
void (*glMultiDrawElements)(GLenum mode, GLsizei *count, GLenum type, GLvoid **indices, GLsizei primcount);
void (*glPointParameteri)(GLenum pname, GLint param);
void (*glPointParameteriv)(GLenum pname, GLint *params);
void (*glPointParameterf)(GLenum pname, GLfloat param);
void (*glPointParameterfv)(GLenum pname, GLfloat *params);
void (*glSecondaryColor3b)(GLbyte red, GLbyte green, GLbyte blue);
void (*glSecondaryColor3bv)(GLbyte *v);
void (*glSecondaryColor3d)(GLdouble red, GLdouble green, GLdouble blue);
void (*glSecondaryColor3dv)(GLdouble *v);
void (*glSecondaryColor3f)(GLfloat red, GLfloat green, GLfloat blue);
void (*glSecondaryColor3fv)(GLfloat *v);
void (*glSecondaryColor3i)(GLint red, GLint green, GLint blue);
void (*glSecondaryColor3iv)(GLint *v);
void (*glSecondaryColor3s)(GLshort red, GLshort green, GLshort blue);
void (*glSecondaryColor3sv)(GLshort *v);
void (*glSecondaryColor3ub)(GLubyte red, GLubyte green, GLubyte blue);
void (*glSecondaryColor3ubv)(GLubyte *v);
void (*glSecondaryColor3ui)(GLuint red, GLuint green, GLuint blue);
void (*glSecondaryColor3uiv)(GLuint *v);
void (*glSecondaryColor3us)(GLushort red, GLushort green, GLushort blue);
void (*glSecondaryColor3usv)(GLushort *v);
void (*glSecondaryColorPointer)(GLint size, GLenum type, GLsizei stride, GLvoid *pointer);
void (*glBlendFuncSeparate)(GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
void (*glWindowPos2d)(GLdouble x, GLdouble y);
void (*glWindowPos2f)(GLfloat x, GLfloat y);
void (*glWindowPos2i)(GLint x, GLint y);
void (*glWindowPos2s)(GLshort x, GLshort y);
void (*glWindowPos2dv)(GLdouble *p);
void (*glWindowPos2fv)(GLfloat *p);
void (*glWindowPos2iv)(GLint *p);
void (*glWindowPos2sv)(GLshort *p);
void (*glWindowPos3d)(GLdouble x, GLdouble y, GLdouble z);
void (*glWindowPos3f)(GLfloat x, GLfloat y, GLfloat z);
void (*glWindowPos3i)(GLint x, GLint y, GLint z);
void (*glWindowPos3s)(GLshort x, GLshort y, GLshort z);
void (*glWindowPos3dv)(GLdouble *p);
void (*glWindowPos3fv)(GLfloat *p);
void (*glWindowPos3iv)(GLint *p);
void (*glWindowPos3sv)(GLshort *p);
