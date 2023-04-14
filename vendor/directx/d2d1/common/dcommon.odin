package d2d_common

import "../../dxgi"

IID :: dxgi.IID
IUnknown :: dxgi.IUnknown
IUnknown_VTable :: dxgi.IUnknown_VTable
HRESULT :: dxgi.HRESULT

COLOR_F :: struct {
	r: f32,
	g: f32,
	b: f32,
	a: f32,
}

ALPHA_MODE :: enum u32 {
	UNKNOWN,
	PREMULTIPLIED,
	STRAIGHT,
	IGNORE,
}

PIXEL_FORMAT :: struct {
	format:    dxgi.FORMAT,
	alphaMode: ALPHA_MODE,
}

POINT_2U :: struct {
	x: u32,
	y: u32,
}

POINT_2F :: struct {
	x: f32,
	y: f32,
}

VECTOR_2F :: struct {
	x: f32,
	y: f32,
}

VECTOR_3F :: struct {
	x: f32,
	y: f32,
	z: f32,
}

VECTOR_4F :: struct {
	x: f32,
	y: f32,
	z: f32,
	w: f32,
}

RECT_F :: struct {
	left:   f32,
	top:    f32,
	right:  f32,
	bottom: f32,
}

RECT_U :: struct {
	left:   u32,
	top:    u32,
	right:  u32,
	bottom: u32,
}

SIZE_F :: struct {
	width:  f32,
	height: f32,
}

SIZE_U :: struct {
	width:  u32,
	height: u32,
}

MATRIX_3X2_F :: struct {
	m11, m12: f32,
	m21, m22: f32,
	dx, dy:   f32,
}

MATRIX_4X3_F :: struct {
	m11, m12, m13: f32,
	m21, m22, m23: f32,
	m31, m32, m33: f32,
	m41, m42, m43: f32,
}

MATRIX_4X4_F :: struct {
	m11, m12, m13, m14: f32,
	m21, m22, m23, m24: f32,
	m31, m32, m33, m34: f32,
	m41, m42, m43, m44: f32,
}

MATRIX_5X4_F :: struct {
	m11, m12, m13, m14: f32,
	m21, m22, m23, m24: f32,
	m31, m32, m33, m34: f32,
	m41, m42, m43, m44: f32,
	m51, m52, m53, m54: f32,
}

FIGURE_BEGIN :: enum u32 {
	FILLED,
	HOLLOW,
}

FIGURE_END :: enum u32 {
	OPEN,
	CLOSED,
}

BEZIER_SEGMENT :: struct {
	point1: POINT_2F,
	point2: POINT_2F,
	point3: POINT_2F,
}

PATH_SEGMENT_Flag :: enum {
	FORCE_UNSTROKED       = 1,
	FORCE_ROUND_LINE_JOIN = 2,
}
PATH_SEGMENT :: bit_set[PATH_SEGMENT_Flag;u32]

FILL_MODE :: enum u32 {
	ALTERNATE,
	WINDING,
}

ISimplifiedGeometrySink_UUID_STRING := "2cd9069e-12e2-11dc-9fed-001143a055f9"
ISimplifiedGeometrySink_UUID := IID{0x2cd9069e, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
ISimplifiedGeometrySink :: struct #raw_union {
	#subtype iunknown:                    IUnknown,
	using isimplifiedgeometrysink_vtable: ISimplifiedGeometrySink_VTable,
}
ISimplifiedGeometrySink_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetFillMode:           proc "stdcall" (this: ^ISimplifiedGeometrySink, fillMode: FILL_MODE),
	SetSegmentFlags:       proc "stdcall" (this: ^ISimplifiedGeometrySink, vertexFlags: PATH_SEGMENT),
	BeginFigure:           proc "stdcall" (this: ^ISimplifiedGeometrySink, startPoint: POINT_2F, figureBegin: FIGURE_BEGIN),
	AddLines:              proc "stdcall" (this: ^ISimplifiedGeometrySink, points: [^]POINT_2F, pointsCount: u32),
	AddBeziers:            proc "stdcall" (this: ^ISimplifiedGeometrySink, beziers: [^]BEZIER_SEGMENT, beziersCount: u32),
	EndFigure:             proc "stdcall" (this: ^ISimplifiedGeometrySink, figureEnd: FIGURE_END),
	Close:                 proc "stdcall" (this: ^ISimplifiedGeometrySink) -> HRESULT,
}


BORDER_MODE :: enum u32 {
	SOFT,
	HARD,
}

BLEND_MODE :: enum u32 {
	MULTIPLY,
	SCREEN,
	DARKEN,
	LIGHTEN,
	DISSOLVE,
	COLOR_BURN,
	LINEAR_BURN,
	DARKER_COLOR,
	LIGHTER_COLOR,
	COLOR_DODGE,
	LINEAR_DODGE,
	OVERLAY,
	SOFT_LIGHT,
	HARD_LIGHT,
	VIVID_LIGHT,
	LINEAR_LIGHT,
	PIN_LIGHT,
	HARD_MIX,
	DIFFERENCE,
	EXCLUSION,
	HUE,
	SATURATION,
	COLOR,
	LUMINOSITY,
	SUBTRACT,
	DIVISION,
}

COLORMATRIX_ALPHA_MODE :: enum u32 {
	PREMULTIPLIED = 1,
	STRAIGHT      = 2,
}

TURBULENCE_NOISE :: enum u32 {
	FRACTAL_SUM,
	TURBULENCE,
}

COMPOSITE_MODE :: enum u32 {
	SOURCE_OVER,
	DESTINATION_OVER,
	SOURCE_IN,
	DESTINATION_IN,
	SOURCE_OUT,
	DESTINATION_OUT,
	SOURCE_ATOP,
	DESTINATION_ATOP,
	XOR,
	PLUS,
	SOURCE_COPY,
	BOUNDED_SOURCE_COPY,
	MASK_INVERT,
}
