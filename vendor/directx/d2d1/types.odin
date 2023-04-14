package d2d1

import "core:sys/windows"
import "../dwrite"
import "../dxgi"
import "../d3d"
import d2d_common "common"

IID :: dxgi.IID
IUnknown :: dxgi.IUnknown
IUnknown_VTable :: dxgi.IUnknown_VTable
HRESULT :: windows.HRESULT
BOOL :: windows.BOOL
HWND :: windows.HWND
HDC :: windows.HDC
RECT :: windows.RECT
PWSTR :: windows.wstring
POINT :: windows.POINT

COLOR_F :: d2d_common.COLOR_F
POINT_2F :: d2d_common.POINT_2F
SIZE_F :: d2d_common.SIZE_F
SIZE_U :: d2d_common.SIZE_U
RECT_F :: d2d_common.RECT_F
RECT_U :: d2d_common.RECT_U
MATRIX_3X2_F :: d2d_common.MATRIX_3X2_F

ISimplifiedGeometrySink :: d2d_common.ISimplifiedGeometrySink
ISimplifiedGeometrySink_VTable :: d2d_common.ISimplifiedGeometrySink_VTable

FILL_MODE :: d2d_common.FILL_MODE
PIXEL_FORMAT :: d2d_common.PIXEL_FORMAT
ALPHA_MODE :: d2d_common.ALPHA_MODE

INTERPOLATION_MODE_DEFINITION :: enum i32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
	FANT,
	MIPMAP_LINEAR,
}

GAMMA :: enum u32 {
	_2_2,
	_1_0,
}

OPACITY_MASK_CONTENT :: enum u32 {
	GRAPHICS,
	TEXT_NATURAL,
	TEXT_GDI_COMPATIBLE,
}

EXTEND_MODE :: enum u32 {
	CLAMP,
	WRAP,
	MIRROR,
}

ANTIALIAS_MODE :: enum u32 {
	PER_PRIMITIVE,
	ALIASED,
}

TEXT_ANTIALIAS_MODE :: enum u32 {
	DEFAULT,
	CLEARTYPE,
	GRAYSCALE,
	ALIASED,
}

BITMAP_INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
}

DRAW_TEXT_OPTIONS_Flag :: enum {
	NO_SNAP,
	CLIP,
	ENABLE_COLOR_FONT,
	DISABLE_COLOR_BITMAP_SNAPPING,
}
DRAW_TEXT_OPTIONS :: bit_set[DRAW_TEXT_OPTIONS_Flag;u32]

BITMAP_PROPERTIES :: struct {
	pixelFormat: PIXEL_FORMAT,
	dpiX:        f32,
	dpiY:        f32,
}

GRADIENT_STOP :: struct {
	position: f32,
	color:    COLOR_F,
}

BRUSH_PROPERTIES :: struct {
	opacity:   f32,
	transform: MATRIX_3X2_F,
}

BITMAP_BRUSH_PROPERTIES :: struct {
	extendModeX:       EXTEND_MODE,
	extendModeY:       EXTEND_MODE,
	interpolationMode: BITMAP_INTERPOLATION_MODE,
}

LINEAR_GRADIENT_BRUSH_PROPERTIES :: struct {
	startPoint: POINT_2F,
	endPoint:   POINT_2F,
}

RADIAL_GRADIENT_BRUSH_PROPERTIES :: struct {
	center:               POINT_2F,
	gradientOriginOffset: POINT_2F,
	radiusX:              f32,
	radiusY:              f32,
}

ARC_SIZE :: enum u32 {
	SMALL,
	LARGE,
}

CAP_STYLE :: enum u32 {
	FLAT,
	SQUARE,
	ROUND,
	TRIANGLE,
}

DASH_STYLE :: enum u32 {
	SOLID,
	DASH,
	DOT,
	DASH_DOT,
	DASH_DOT_DOT,
	CUSTOM,
}

LINE_JOIN :: enum u32 {
	MITER,
	BEVEL,
	ROUND,
	MITER_OR_BEVEL,
}

COMBINE_MODE :: enum u32 {
	UNION,
	INTERSECT,
	XOR,
	EXCLUDE,
}

GEOMETRY_RELATION :: enum u32 {
	UNKNOWN,
	DISJOINT,
	IS_CONTAINED,
	CONTAINS,
	OVERLAP,
}

GEOMETRY_SIMPLIFICATION_OPTION :: enum u32 {
	CUBICS_AND_LINES,
	LINES,
}

TRIANGLE :: struct {
	point1: POINT_2F,
	point2: POINT_2F,
	point3: POINT_2F,
}

SWEEP_DIRECTION :: enum u32 {
	COUNTER_CLOCKWISE,
	CLOCKWISE,
}

ARC_SEGMENT :: struct {
	point:          POINT_2F,
	size:           SIZE_F,
	rotationAngle:  f32,
	sweepDirection: SWEEP_DIRECTION,
	arcSize:        ARC_SIZE,
}

QUADRATIC_BEZIER_SEGMENT :: struct {
	point1: POINT_2F,
	point2: POINT_2F,
}

ELLIPSE :: struct {
	point:   POINT_2F,
	radiusX: f32,
	radiusY: f32,
}

ROUNDED_RECT :: struct {
	rect:    RECT_F,
	radiusX: f32,
	radiusY: f32,
}

STROKE_STYLE_PROPERTIES :: struct {
	startCap:   CAP_STYLE,
	endCap:     CAP_STYLE,
	dashCap:    CAP_STYLE,
	lineJoin:   LINE_JOIN,
	miterLimit: f32,
	dashStyle:  DASH_STYLE,
	dashOffset: f32,
}

LAYER_OPTIONS_Flag :: enum {
	INITIALIZE_FOR_CLEARTYPE = 1,
}
LAYER_OPTIONS :: bit_set[LAYER_OPTIONS_Flag;u32]

LAYER_PARAMETERS :: struct {
	contentBounds:     RECT_F,
	geometricMask:     ^IGeometry,
	maskAntialiasMode: ANTIALIAS_MODE,
	maskTransform:     MATRIX_3X2_F,
	opacity:           f32,
	opacityBrush:      ^IBrush,
	layerOptions:      LAYER_OPTIONS,
}

WINDOW_STATE_Flag :: enum {
	OCCLUDED = 1,
}
WINDOW_STATE :: bit_set[WINDOW_STATE_Flag;u32]

RENDER_TARGET_TYPE :: enum u32 {
	DEFAULT,
	SOFTWARE,
	HARDWARE,
}

FEATURE_LEVEL :: enum u32 {
	_DEFAULT = 0,
	_9       = 37120,
	_10      = 40960,
}

RENDER_TARGET_USAGE_Flag :: enum {
	FORCE_BITMAP_REMOTING = 1,
	GDI_COMPATIBLE        = 2,
}
RENDER_TARGET_USAGE :: bit_set[RENDER_TARGET_USAGE_Flag;u32]

PRESENT_OPTIONS_Flag :: enum {
	RETAIN_CONTENTS = 1,
	IMMEDIATELY     = 2,
}
PRESENT_OPTIONS :: bit_set[PRESENT_OPTIONS_Flag;u32]

RENDER_TARGET_PROPERTIES :: struct {
	type:        RENDER_TARGET_TYPE,
	pixelFormat: PIXEL_FORMAT,
	dpiX:        f32,
	dpiY:        f32,
	usage:       RENDER_TARGET_USAGE,
	minLevel:    FEATURE_LEVEL,
}

HWND_RENDER_TARGET_PROPERTIES :: struct {
	hwnd:           HWND,
	pixelSize:      SIZE_U,
	presentOptions: PRESENT_OPTIONS,
}

COMPATIBLE_RENDER_TARGET_OPTIONS_Flag :: enum {
	GDI_COMPATIBLE = 1,
}
COMPATIBLE_RENDER_TARGET_OPTIONS :: bit_set[COMPATIBLE_RENDER_TARGET_OPTIONS_Flag;u32]

DRAWING_STATE_DESCRIPTION :: struct {
	antialiasMode:     ANTIALIAS_MODE,
	textAntialiasMode: TEXT_ANTIALIAS_MODE,
	tag1:              u64,
	tag2:              u64,
	transform:         MATRIX_3X2_F,
}

DC_INITIALIZE_MODE :: enum u32 {
	COPY,
	CLEAR,
}

DEBUG_LEVEL :: enum u32 {
	NONE,
	ERROR,
	WARNING,
	INFORMATION,
}

FACTORY_TYPE :: enum u32 {
	SINGLE_THREADED,
	MULTI_THREADED,
}

FACTORY_OPTIONS :: struct {
	debugLevel: DEBUG_LEVEL,
}

IResource_UUID_STRING := "2cd90691-12e2-11dc-9fed-001143a055f9"
IResource_UUID := IID{0x2cd90691, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IResource :: struct #raw_union {
	#subtype iunknown:      IUnknown,
	using iresource_vtable: IResource_VTable,
}
IResource_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetFactory:            proc "stdcall" (this: ^IResource, factory: ^^IFactory),
}


IImage_UUID_STRING := "65019f75-8da2-497c-b32c-dfa34e48ede6"
IImage_UUID := IID{0x65019f75, 0x8da2, 0x497c, {0xb3, 0x2c, 0xdf, 0xa3, 0x4e, 0x48, 0xed, 0xe6}}
IImage :: struct #raw_union {
	#subtype iresource:  IResource,
	using iimage_vtable: IImage_VTable,
}
IImage_VTable :: struct {
	using iresource_vtable: IResource_VTable,
}


IBitmap_UUID_STRING := "a2296057-ea42-4099-983b-539fb6505426"
IBitmap_UUID := IID{0xa2296057, 0xea42, 0x4099, {0x98, 0x3b, 0x53, 0x9f, 0xb6, 0x50, 0x54, 0x26}}
IBitmap :: struct #raw_union {
	#subtype iimage:      IImage,
	using ibitmap_vtable: IBitmap_VTable,
}
IBitmap_VTable :: struct {
	using iimage_vtable:  IImage_VTable,
	GetSize:              proc "stdcall" (this: ^IBitmap) -> SIZE_F,
	GetPixelSize:         proc "stdcall" (this: ^IBitmap) -> SIZE_U,
	GetPixelFormat:       proc "stdcall" (this: ^IBitmap) -> PIXEL_FORMAT,
	GetDpi:               proc "stdcall" (this: ^IBitmap, dpiX: ^f32, dpiY: ^f32),
	CopyFromBitmap:       proc "stdcall" (this: ^IBitmap, destPoint: ^d2d_common.POINT_2U, bitmap: ^IBitmap, srcRect: ^RECT_U) -> HRESULT,
	CopyFromRenderTarget: proc "stdcall" (this: ^IBitmap, destPoint: ^d2d_common.POINT_2U, renderTarget: ^IRenderTarget, srcRect: ^RECT_U) -> HRESULT,
	CopyFromMemory:       proc "stdcall" (this: ^IBitmap, dstRect: ^RECT_U, srcData: rawptr, pitch: u32) -> HRESULT,
}


IGradientStopCollection_UUID_STRING := "2cd906a7-12e2-11dc-9fed-001143a055f9"
IGradientStopCollection_UUID := IID{0x2cd906a7, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IGradientStopCollection :: struct #raw_union {
	#subtype iresource:                   IResource,
	using igradientstopcollection_vtable: IGradientStopCollection_VTable,
}
IGradientStopCollection_VTable :: struct {
	using iresource_vtable:     IResource_VTable,
	GetGradientStopCount:       proc "stdcall" (this: ^IGradientStopCollection) -> u32,
	GetGradientStops:           proc "stdcall" (this: ^IGradientStopCollection, gradientStops: [^]GRADIENT_STOP, gradientStopsCount: u32),
	GetColorInterpolationGamma: proc "stdcall" (this: ^IGradientStopCollection) -> GAMMA,
	GetExtendMode:              proc "stdcall" (this: ^IGradientStopCollection) -> EXTEND_MODE,
}


IBrush_UUID_STRING := "2cd906a8-12e2-11dc-9fed-001143a055f9"
IBrush_UUID := IID{0x2cd906a8, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IBrush :: struct #raw_union {
	#subtype iresource:  IResource,
	using ibrush_vtable: IBrush_VTable,
}
IBrush_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	SetOpacity:             proc "stdcall" (this: ^IBrush, opacity: f32),
	SetTransform:           proc "stdcall" (this: ^IBrush, #by_ptr transform: MATRIX_3X2_F),
	GetOpacity:             proc "stdcall" (this: ^IBrush) -> f32,
	GetTransform:           proc "stdcall" (this: ^IBrush, transform: ^MATRIX_3X2_F),
}


IBitmapBrush_UUID_STRING := "2cd906aa-12e2-11dc-9fed-001143a055f9"
IBitmapBrush_UUID := IID{0x2cd906aa, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IBitmapBrush :: struct #raw_union {
	#subtype ibrush:           IBrush,
	using ibitmapbrush_vtable: IBitmapBrush_VTable,
}
IBitmapBrush_VTable :: struct {
	using ibrush_vtable:  IBrush_VTable,
	SetExtendModeX:       proc "stdcall" (this: ^IBitmapBrush, extendModeX: EXTEND_MODE),
	SetExtendModeY:       proc "stdcall" (this: ^IBitmapBrush, extendModeY: EXTEND_MODE),
	SetInterpolationMode: proc "stdcall" (this: ^IBitmapBrush, interpolationMode: BITMAP_INTERPOLATION_MODE),
	SetBitmap:            proc "stdcall" (this: ^IBitmapBrush, bitmap: ^IBitmap),
	GetExtendModeX:       proc "stdcall" (this: ^IBitmapBrush) -> EXTEND_MODE,
	GetExtendModeY:       proc "stdcall" (this: ^IBitmapBrush) -> EXTEND_MODE,
	GetInterpolationMode: proc "stdcall" (this: ^IBitmapBrush) -> BITMAP_INTERPOLATION_MODE,
	GetBitmap:            proc "stdcall" (this: ^IBitmapBrush, bitmap: ^^IBitmap),
}


ISolidColorBrush_UUID_STRING := "2cd906a9-12e2-11dc-9fed-001143a055f9"
ISolidColorBrush_UUID := IID{0x2cd906a9, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
ISolidColorBrush :: struct #raw_union {
	#subtype ibrush:               IBrush,
	using isolidcolorbrush_vtable: ISolidColorBrush_VTable,
}
ISolidColorBrush_VTable :: struct {
	using ibrush_vtable: IBrush_VTable,
	SetColor:            proc "stdcall" (this: ^ISolidColorBrush, #by_ptr color: COLOR_F),
	GetColor:            proc "stdcall" (this: ^ISolidColorBrush) -> COLOR_F,
}


ILinearGradientBrush_UUID_STRING := "2cd906ab-12e2-11dc-9fed-001143a055f9"
ILinearGradientBrush_UUID := IID{0x2cd906ab, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
ILinearGradientBrush :: struct #raw_union {
	#subtype ibrush:                   IBrush,
	using ilineargradientbrush_vtable: ILinearGradientBrush_VTable,
}
ILinearGradientBrush_VTable :: struct {
	using ibrush_vtable:       IBrush_VTable,
	SetStartPoint:             proc "stdcall" (this: ^ILinearGradientBrush, startPoint: POINT_2F),
	SetEndPoint:               proc "stdcall" (this: ^ILinearGradientBrush, endPoint: POINT_2F),
	GetStartPoint:             proc "stdcall" (this: ^ILinearGradientBrush) -> POINT_2F,
	GetEndPoint:               proc "stdcall" (this: ^ILinearGradientBrush) -> POINT_2F,
	GetGradientStopCollection: proc "stdcall" (this: ^ILinearGradientBrush, gradientStopCollection: ^^IGradientStopCollection),
}


IRadialGradientBrush_UUID_STRING := "2cd906ac-12e2-11dc-9fed-001143a055f9"
IRadialGradientBrush_UUID := IID{0x2cd906ac, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IRadialGradientBrush :: struct #raw_union {
	#subtype ibrush:                   IBrush,
	using iradialgradientbrush_vtable: IRadialGradientBrush_VTable,
}
IRadialGradientBrush_VTable :: struct {
	using ibrush_vtable:       IBrush_VTable,
	SetCenter:                 proc "stdcall" (this: ^IRadialGradientBrush, center: POINT_2F),
	SetGradientOriginOffset:   proc "stdcall" (this: ^IRadialGradientBrush, gradientOriginOffset: POINT_2F),
	SetRadiusX:                proc "stdcall" (this: ^IRadialGradientBrush, radiusX: f32),
	SetRadiusY:                proc "stdcall" (this: ^IRadialGradientBrush, radiusY: f32),
	GetCenter:                 proc "stdcall" (this: ^IRadialGradientBrush) -> POINT_2F,
	GetGradientOriginOffset:   proc "stdcall" (this: ^IRadialGradientBrush) -> POINT_2F,
	GetRadiusX:                proc "stdcall" (this: ^IRadialGradientBrush) -> f32,
	GetRadiusY:                proc "stdcall" (this: ^IRadialGradientBrush) -> f32,
	GetGradientStopCollection: proc "stdcall" (this: ^IRadialGradientBrush, gradientStopCollection: ^^IGradientStopCollection),
}


IStrokeStyle_UUID_STRING := "2cd9069d-12e2-11dc-9fed-001143a055f9"
IStrokeStyle_UUID := IID{0x2cd9069d, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IStrokeStyle :: struct #raw_union {
	#subtype iresource:        IResource,
	using istrokestyle_vtable: IStrokeStyle_VTable,
}
IStrokeStyle_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	GetStartCap:            proc "stdcall" (this: ^IStrokeStyle) -> CAP_STYLE,
	GetEndCap:              proc "stdcall" (this: ^IStrokeStyle) -> CAP_STYLE,
	GetDashCap:             proc "stdcall" (this: ^IStrokeStyle) -> CAP_STYLE,
	GetMiterLimit:          proc "stdcall" (this: ^IStrokeStyle) -> f32,
	GetLineJoin:            proc "stdcall" (this: ^IStrokeStyle) -> LINE_JOIN,
	GetDashOffset:          proc "stdcall" (this: ^IStrokeStyle) -> f32,
	GetDashStyle:           proc "stdcall" (this: ^IStrokeStyle) -> DASH_STYLE,
	GetDashesCount:         proc "stdcall" (this: ^IStrokeStyle) -> u32,
	GetDashes:              proc "stdcall" (this: ^IStrokeStyle, dashes: [^]f32, dashesCount: u32),
}


IGeometry_UUID_STRING := "2cd906a1-12e2-11dc-9fed-001143a055f9"
IGeometry_UUID := IID{0x2cd906a1, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IGeometry :: struct #raw_union {
	#subtype iresource:     IResource,
	using igeometry_vtable: IGeometry_VTable,
}
IGeometry_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	GetBounds:              proc "stdcall" (this: ^IGeometry, worldTransform: ^MATRIX_3X2_F, bounds: ^RECT_F) -> HRESULT,
	GetWidenedBounds:       proc "stdcall" (
		this: ^IGeometry,
		strokeWidth: f32,
		strokeStyle: ^IStrokeStyle,
		worldTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		bounds: ^RECT_F,
	) -> HRESULT,
	StrokeContainsPoint:    proc "stdcall" (
		this: ^IGeometry,
		point: POINT_2F,
		strokeWidth: f32,
		strokeStyle: ^IStrokeStyle,
		worldTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		contains: ^BOOL,
	) -> HRESULT,
	FillContainsPoint:      proc "stdcall" (this: ^IGeometry, point: POINT_2F, worldTransform: ^MATRIX_3X2_F, flatteningTolerance: f32, contains: ^BOOL) -> HRESULT,
	CompareWithGeometry:    proc "stdcall" (
		this: ^IGeometry,
		inputGeometry: ^IGeometry,
		inputGeometryTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		relation: ^GEOMETRY_RELATION,
	) -> HRESULT,
	Simplify:               proc "stdcall" (
		this: ^IGeometry,
		simplificationOption: GEOMETRY_SIMPLIFICATION_OPTION,
		worldTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		geometrySink: ^ISimplifiedGeometrySink,
	) -> HRESULT,
	Tessellate:             proc "stdcall" (this: ^IGeometry, worldTransform: ^MATRIX_3X2_F, flatteningTolerance: f32, tessellationSink: ^ITessellationSink) -> HRESULT,
	CombineWithGeometry:    proc "stdcall" (
		this: ^IGeometry,
		inputGeometry: ^IGeometry,
		combineMode: COMBINE_MODE,
		inputGeometryTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		geometrySink: ^ISimplifiedGeometrySink,
	) -> HRESULT,
	Outline:                proc "stdcall" (this: ^IGeometry, worldTransform: ^MATRIX_3X2_F, flatteningTolerance: f32, geometrySink: ^ISimplifiedGeometrySink) -> HRESULT,
	ComputeArea:            proc "stdcall" (this: ^IGeometry, worldTransform: ^MATRIX_3X2_F, flatteningTolerance: f32, area: ^f32) -> HRESULT,
	ComputeLength:          proc "stdcall" (this: ^IGeometry, worldTransform: ^MATRIX_3X2_F, flatteningTolerance: f32, length: ^f32) -> HRESULT,
	ComputePointAtLength:   proc "stdcall" (
		this: ^IGeometry,
		length: f32,
		worldTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		point: ^POINT_2F,
		unitTangentVector: ^POINT_2F,
	) -> HRESULT,
	Widen:                  proc "stdcall" (
		this: ^IGeometry,
		strokeWidth: f32,
		strokeStyle: ^IStrokeStyle,
		worldTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		geometrySink: ^ISimplifiedGeometrySink,
	) -> HRESULT,
}


IRectangleGeometry_UUID_STRING := "2cd906a2-12e2-11dc-9fed-001143a055f9"
IRectangleGeometry_UUID := IID{0x2cd906a2, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IRectangleGeometry :: struct #raw_union {
	#subtype igeometry:              IGeometry,
	using irectanglegeometry_vtable: IRectangleGeometry_VTable,
}
IRectangleGeometry_VTable :: struct {
	using igeometry_vtable: IGeometry_VTable,
	GetRect:                proc "stdcall" (this: ^IRectangleGeometry, rect: ^RECT_F),
}


IRoundedRectangleGeometry_UUID_STRING := "2cd906a3-12e2-11dc-9fed-001143a055f9"
IRoundedRectangleGeometry_UUID := IID{0x2cd906a3, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IRoundedRectangleGeometry :: struct #raw_union {
	#subtype igeometry:                     IGeometry,
	using iroundedrectanglegeometry_vtable: IRoundedRectangleGeometry_VTable,
}
IRoundedRectangleGeometry_VTable :: struct {
	using igeometry_vtable: IGeometry_VTable,
	GetRoundedRect:         proc "stdcall" (this: ^IRoundedRectangleGeometry, roundedRect: ^ROUNDED_RECT),
}


IEllipseGeometry_UUID_STRING := "2cd906a4-12e2-11dc-9fed-001143a055f9"
IEllipseGeometry_UUID := IID{0x2cd906a4, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IEllipseGeometry :: struct #raw_union {
	#subtype igeometry:            IGeometry,
	using iellipsegeometry_vtable: IEllipseGeometry_VTable,
}
IEllipseGeometry_VTable :: struct {
	using igeometry_vtable: IGeometry_VTable,
	GetEllipse:             proc "stdcall" (this: ^IEllipseGeometry, ellipse: ^ELLIPSE),
}


IGeometryGroup_UUID_STRING := "2cd906a6-12e2-11dc-9fed-001143a055f9"
IGeometryGroup_UUID := IID{0x2cd906a6, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IGeometryGroup :: struct #raw_union {
	#subtype igeometry:          IGeometry,
	using igeometrygroup_vtable: IGeometryGroup_VTable,
}
IGeometryGroup_VTable :: struct {
	using igeometry_vtable: IGeometry_VTable,
	GetFillMode:            proc "stdcall" (this: ^IGeometryGroup) -> FILL_MODE,
	GetSourceGeometryCount: proc "stdcall" (this: ^IGeometryGroup) -> u32,
	GetSourceGeometries:    proc "stdcall" (this: ^IGeometryGroup, geometries: [^]^IGeometry, geometriesCount: u32),
}


ITransformedGeometry_UUID_STRING := "2cd906bb-12e2-11dc-9fed-001143a055f9"
ITransformedGeometry_UUID := IID{0x2cd906bb, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
ITransformedGeometry :: struct #raw_union {
	#subtype igeometry:                IGeometry,
	using itransformedgeometry_vtable: ITransformedGeometry_VTable,
}
ITransformedGeometry_VTable :: struct {
	using igeometry_vtable: IGeometry_VTable,
	GetSourceGeometry:      proc "stdcall" (this: ^ITransformedGeometry, sourceGeometry: ^^IGeometry),
	GetTransform:           proc "stdcall" (this: ^ITransformedGeometry, transform: ^MATRIX_3X2_F),
}


IGeometrySink_UUID_STRING := "2cd9069f-12e2-11dc-9fed-001143a055f9"
IGeometrySink_UUID := IID{0x2cd9069f, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IGeometrySink :: struct #raw_union {
	#subtype isimplifiedgeometrysink: ISimplifiedGeometrySink,
	using igeometrysink_vtable: IGeometrySink_VTable,
}
IGeometrySink_VTable :: struct {
	using isimplifiedgeometrysink_vtable: ISimplifiedGeometrySink_VTable,
	AddLine:                              proc "stdcall" (this: ^IGeometrySink, point: POINT_2F),
	AddBezier:                            proc "stdcall" (this: ^IGeometrySink, #by_ptr bezier: d2d_common.BEZIER_SEGMENT),
	AddQuadraticBezier:                   proc "stdcall" (this: ^IGeometrySink, #by_ptr bezier: QUADRATIC_BEZIER_SEGMENT),
	AddQuadraticBeziers:                  proc "stdcall" (this: ^IGeometrySink, beziers: [^]QUADRATIC_BEZIER_SEGMENT, beziersCount: u32),
	AddArc:                               proc "stdcall" (this: ^IGeometrySink, #by_ptr arc: ARC_SEGMENT),
}


ITessellationSink_UUID_STRING := "2cd906c1-12e2-11dc-9fed-001143a055f9"
ITessellationSink_UUID := IID{0x2cd906c1, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
ITessellationSink :: struct #raw_union {
	#subtype iunknown:              IUnknown,
	using itessellationsink_vtable: ITessellationSink_VTable,
}
ITessellationSink_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AddTriangles:          proc "stdcall" (this: ^ITessellationSink, triangles: [^]TRIANGLE, trianglesCount: u32),
	Close:                 proc "stdcall" (this: ^ITessellationSink) -> HRESULT,
}


IPathGeometry_UUID_STRING := "2cd906a5-12e2-11dc-9fed-001143a055f9"
IPathGeometry_UUID := IID{0x2cd906a5, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IPathGeometry :: struct #raw_union {
	#subtype igeometry:         IGeometry,
	using ipathgeometry_vtable: IPathGeometry_VTable,
}
IPathGeometry_VTable :: struct {
	using igeometry_vtable: IGeometry_VTable,
	Open:                   proc "stdcall" (this: ^IPathGeometry, geometrySink: ^^IGeometrySink) -> HRESULT,
	Stream:                 proc "stdcall" (this: ^IPathGeometry, geometrySink: ^IGeometrySink) -> HRESULT,
	GetSegmentCount:        proc "stdcall" (this: ^IPathGeometry, count: ^u32) -> HRESULT,
	GetFigureCount:         proc "stdcall" (this: ^IPathGeometry, count: ^u32) -> HRESULT,
}


IMesh_UUID_STRING := "2cd906c2-12e2-11dc-9fed-001143a055f9"
IMesh_UUID := IID{0x2cd906c2, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IMesh :: struct #raw_union {
	#subtype iresource: IResource,
	using imesh_vtable: IMesh_VTable,
}
IMesh_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	Open:                   proc "stdcall" (this: ^IMesh, tessellationSink: ^^ITessellationSink) -> HRESULT,
}


ILayer_UUID_STRING := "2cd9069b-12e2-11dc-9fed-001143a055f9"
ILayer_UUID := IID{0x2cd9069b, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
ILayer :: struct #raw_union {
	#subtype iresource:  IResource,
	using ilayer_vtable: ILayer_VTable,
}
ILayer_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	GetSize:                proc "stdcall" (this: ^ILayer) -> SIZE_F,
}


IDrawingStateBlock_UUID_STRING := "28506e39-ebf6-46a1-bb47-fd85565ab957"
IDrawingStateBlock_UUID := IID{0x28506e39, 0xebf6, 0x46a1, {0xbb, 0x47, 0xfd, 0x85, 0x56, 0x5a, 0xb9, 0x57}}
IDrawingStateBlock :: struct #raw_union {
	#subtype iresource:              IResource,
	using idrawingstateblock_vtable: IDrawingStateBlock_VTable,
}
IDrawingStateBlock_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	GetDescription_1:       proc "stdcall" (this: ^IDrawingStateBlock, stateDescription: ^DRAWING_STATE_DESCRIPTION),
	SetDescription_1:       proc "stdcall" (this: ^IDrawingStateBlock, #by_ptr stateDescription: DRAWING_STATE_DESCRIPTION),
	SetTextRenderingParams: proc "stdcall" (this: ^IDrawingStateBlock, textRenderingParams: ^dwrite.IRenderingParams),
	GetTextRenderingParams: proc "stdcall" (this: ^IDrawingStateBlock, textRenderingParams: ^^dwrite.IRenderingParams),
}


IRenderTarget_UUID_STRING := "2cd90694-12e2-11dc-9fed-001143a055f9"
IRenderTarget_UUID := IID{0x2cd90694, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IRenderTarget :: struct #raw_union {
	#subtype iresource:         IResource,
	using irendertarget_vtable: IRenderTarget_VTable,
}
IRenderTarget_VTable :: struct {
	using iresource_vtable:       IResource_VTable,
	CreateBitmap:                 proc "stdcall" (
		this: ^IRenderTarget,
		size: SIZE_U,
		srcData: rawptr,
		pitch: u32,
		#by_ptr bitmapProperties: BITMAP_PROPERTIES,
		bitmap: ^^IBitmap,
	) -> HRESULT,
	CreateBitmapFromWicBitmap:    proc "stdcall" (this: ^IRenderTarget, wicBitmapSource: ^IWICBitmapSource, bitmapProperties: ^BITMAP_PROPERTIES, bitmap: ^^IBitmap) -> HRESULT,
	CreateSharedBitmap:           proc "stdcall" (this: ^IRenderTarget, #by_ptr riid: IID, data: rawptr, bitmapProperties: ^BITMAP_PROPERTIES, bitmap: ^^IBitmap) -> HRESULT,
	CreateBitmapBrush:            proc "stdcall" (
		this: ^IRenderTarget,
		bitmap: ^IBitmap,
		bitmapBrushProperties: ^BITMAP_BRUSH_PROPERTIES,
		brushProperties: ^BRUSH_PROPERTIES,
		bitmapBrush: ^^IBitmapBrush,
	) -> HRESULT,
	CreateSolidColorBrush:        proc "stdcall" (this: ^IRenderTarget, #by_ptr color: COLOR_F, brushProperties: ^BRUSH_PROPERTIES, solidColorBrush: ^^ISolidColorBrush) -> HRESULT,
	CreateGradientStopCollection: proc "stdcall" (
		this: ^IRenderTarget,
		gradientStops: [^]GRADIENT_STOP,
		gradientStopsCount: u32,
		colorInterpolationGamma: GAMMA,
		extendMode: EXTEND_MODE,
		gradientStopCollection: ^^IGradientStopCollection,
	) -> HRESULT,
	CreateLinearGradientBrush:    proc "stdcall" (
		this: ^IRenderTarget,
		#by_ptr linearGradientBrushProperties: LINEAR_GRADIENT_BRUSH_PROPERTIES,
		brushProperties: ^BRUSH_PROPERTIES,
		gradientStopCollection: ^IGradientStopCollection,
		linearGradientBrush: ^^ILinearGradientBrush,
	) -> HRESULT,
	CreateRadialGradientBrush:    proc "stdcall" (
		this: ^IRenderTarget,
		#by_ptr radialGradientBrushProperties: RADIAL_GRADIENT_BRUSH_PROPERTIES,
		brushProperties: ^BRUSH_PROPERTIES,
		gradientStopCollection: ^IGradientStopCollection,
		radialGradientBrush: ^^IRadialGradientBrush,
	) -> HRESULT,
	CreateCompatibleRenderTarget: proc "stdcall" (
		this: ^IRenderTarget,
		desiredSize: ^SIZE_F,
		desiredPixelSize: ^SIZE_U,
		desiredFormat: ^PIXEL_FORMAT,
		options: COMPATIBLE_RENDER_TARGET_OPTIONS,
		bitmapRenderTarget: ^^IBitmapRenderTarget,
	) -> HRESULT,
	CreateLayer:                  proc "stdcall" (this: ^IRenderTarget, size: ^SIZE_F, layer: ^^ILayer) -> HRESULT,
	CreateMesh:                   proc "stdcall" (this: ^IRenderTarget, mesh: ^^IMesh) -> HRESULT,
	DrawLine:                     proc "stdcall" (this: ^IRenderTarget, point0: POINT_2F, point1: POINT_2F, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle),
	DrawRectangle:                proc "stdcall" (this: ^IRenderTarget, #by_ptr rect: RECT_F, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle),
	FillRectangle:                proc "stdcall" (this: ^IRenderTarget, #by_ptr rect: RECT_F, brush: ^IBrush),
	DrawRoundedRectangle:         proc "stdcall" (this: ^IRenderTarget, #by_ptr roundedRect: ROUNDED_RECT, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle),
	FillRoundedRectangle:         proc "stdcall" (this: ^IRenderTarget, #by_ptr roundedRect: ROUNDED_RECT, brush: ^IBrush),
	DrawEllipse:                  proc "stdcall" (this: ^IRenderTarget, #by_ptr ellipse: ELLIPSE, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle),
	FillEllipse:                  proc "stdcall" (this: ^IRenderTarget, #by_ptr ellipse: ELLIPSE, brush: ^IBrush),
	DrawGeometry:                 proc "stdcall" (this: ^IRenderTarget, geometry: ^IGeometry, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle),
	FillGeometry:                 proc "stdcall" (this: ^IRenderTarget, geometry: ^IGeometry, brush: ^IBrush, opacityBrush: ^IBrush),
	FillMesh:                     proc "stdcall" (this: ^IRenderTarget, mesh: ^IMesh, brush: ^IBrush),
	FillOpacityMask:              proc "stdcall" (
		this: ^IRenderTarget,
		opacityMask: ^IBitmap,
		brush: ^IBrush,
		content: OPACITY_MASK_CONTENT,
		destinationRectangle: ^RECT_F,
		sourceRectangle: ^RECT_F,
	),
	DrawBitmap:                   proc "stdcall" (
		this: ^IRenderTarget,
		bitmap: ^IBitmap,
		destinationRectangle: ^RECT_F,
		opacity: f32,
		interpolationMode: BITMAP_INTERPOLATION_MODE,
		sourceRectangle: ^RECT_F,
	),
	DrawText:                     proc "stdcall" (
		this: ^IRenderTarget,
		string: [^]u8,
		stringLength: u32,
		textFormat: ^dwrite.ITextFormat,
		#by_ptr layoutRect: RECT_F,
		defaultFillBrush: ^IBrush,
		options: DRAW_TEXT_OPTIONS,
		measuringMode: dwrite.MEASURING_MODE,
	),
	DrawTextLayout:               proc "stdcall" (this: ^IRenderTarget, origin: POINT_2F, textLayout: ^dwrite.ITextLayout, defaultFillBrush: ^IBrush, options: DRAW_TEXT_OPTIONS),
	DrawGlyphRun:                 proc "stdcall" (
		this: ^IRenderTarget,
		baselineOrigin: POINT_2F,
		#by_ptr glyphRun: dwrite.GLYPH_RUN,
		foregroundBrush: ^IBrush,
		measuringMode: dwrite.MEASURING_MODE,
	),
	SetTransform:                 proc "stdcall" (this: ^IRenderTarget, #by_ptr transform: MATRIX_3X2_F),
	GetTransform:                 proc "stdcall" (this: ^IRenderTarget, transform: ^MATRIX_3X2_F),
	SetAntialiasMode:             proc "stdcall" (this: ^IRenderTarget, antialiasMode: ANTIALIAS_MODE),
	GetAntialiasMode:             proc "stdcall" (this: ^IRenderTarget) -> ANTIALIAS_MODE,
	SetTextAntialiasMode:         proc "stdcall" (this: ^IRenderTarget, textAntialiasMode: TEXT_ANTIALIAS_MODE),
	GetTextAntialiasMode:         proc "stdcall" (this: ^IRenderTarget) -> TEXT_ANTIALIAS_MODE,
	SetTextRenderingParams:       proc "stdcall" (this: ^IRenderTarget, textRenderingParams: ^dwrite.IRenderingParams),
	GetTextRenderingParams:       proc "stdcall" (this: ^IRenderTarget, textRenderingParams: ^^dwrite.IRenderingParams),
	SetTags:                      proc "stdcall" (this: ^IRenderTarget, tag1: u64, tag2: u64),
	GetTags:                      proc "stdcall" (this: ^IRenderTarget, tag1: ^u64, tag2: ^u64),
	PushLayer:                    proc "stdcall" (this: ^IRenderTarget, #by_ptr layerParameters: LAYER_PARAMETERS, layer: ^ILayer),
	PopLayer:                     proc "stdcall" (this: ^IRenderTarget),
	Flush:                        proc "stdcall" (this: ^IRenderTarget, tag1: ^u64, tag2: ^u64) -> HRESULT,
	SaveDrawingState:             proc "stdcall" (this: ^IRenderTarget, drawingStateBlock: ^IDrawingStateBlock),
	RestoreDrawingState:          proc "stdcall" (this: ^IRenderTarget, drawingStateBlock: ^IDrawingStateBlock),
	PushAxisAlignedClip:          proc "stdcall" (this: ^IRenderTarget, #by_ptr clipRect: RECT_F, antialiasMode: ANTIALIAS_MODE),
	PopAxisAlignedClip:           proc "stdcall" (this: ^IRenderTarget),
	Clear:                        proc "stdcall" (this: ^IRenderTarget, clearColor: ^COLOR_F),
	BeginDraw:                    proc "stdcall" (this: ^IRenderTarget),
	EndDraw:                      proc "stdcall" (this: ^IRenderTarget, tag1: ^u64, tag2: ^u64) -> HRESULT,
	GetPixelFormat:               proc "stdcall" (this: ^IRenderTarget) -> PIXEL_FORMAT,
	SetDpi:                       proc "stdcall" (this: ^IRenderTarget, dpiX: f32, dpiY: f32),
	GetDpi:                       proc "stdcall" (this: ^IRenderTarget, dpiX: ^f32, dpiY: ^f32),
	GetSize:                      proc "stdcall" (this: ^IRenderTarget) -> SIZE_F,
	GetPixelSize:                 proc "stdcall" (this: ^IRenderTarget) -> SIZE_U,
	GetMaximumBitmapSize:         proc "stdcall" (this: ^IRenderTarget) -> u32,
	IsSupported:                  proc "stdcall" (this: ^IRenderTarget, #by_ptr renderTargetProperties: RENDER_TARGET_PROPERTIES) -> BOOL,
}


IBitmapRenderTarget_UUID_STRING := "2cd90695-12e2-11dc-9fed-001143a055f9"
IBitmapRenderTarget_UUID := IID{0x2cd90695, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IBitmapRenderTarget :: struct #raw_union {
	#subtype irendertarget:           IRenderTarget,
	using ibitmaprendertarget_vtable: IBitmapRenderTarget_VTable,
}
IBitmapRenderTarget_VTable :: struct {
	using irendertarget_vtable: IRenderTarget_VTable,
	GetBitmap:                  proc "stdcall" (this: ^IBitmapRenderTarget, bitmap: ^^IBitmap) -> HRESULT,
}


IHwndRenderTarget_UUID_STRING := "2cd90698-12e2-11dc-9fed-001143a055f9"
IHwndRenderTarget_UUID := IID{0x2cd90698, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
IHwndRenderTarget :: struct #raw_union {
	#subtype irendertarget:         IRenderTarget,
	using ihwndrendertarget_vtable: IHwndRenderTarget_VTable,
}
IHwndRenderTarget_VTable :: struct {
	using irendertarget_vtable: IRenderTarget_VTable,
	CheckWindowState:           proc "stdcall" (this: ^IHwndRenderTarget) -> WINDOW_STATE,
	Resize:                     proc "stdcall" (this: ^IHwndRenderTarget, #by_ptr pixelSize: SIZE_U) -> HRESULT,
	GetHwnd:                    proc "stdcall" (this: ^IHwndRenderTarget) -> HWND,
}


IGdiInteropRenderTarget_UUID_STRING := "e0db51c3-6f77-4bae-b3d5-e47509b35838"
IGdiInteropRenderTarget_UUID := IID{0xe0db51c3, 0x6f77, 0x4bae, {0xb3, 0xd5, 0xe4, 0x75, 0x09, 0xb3, 0x58, 0x38}}
IGdiInteropRenderTarget :: struct #raw_union {
	#subtype iunknown:                    IUnknown,
	using igdiinteroprendertarget_vtable: IGdiInteropRenderTarget_VTable,
}
IGdiInteropRenderTarget_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetDC:                 proc "stdcall" (this: ^IGdiInteropRenderTarget, mode: DC_INITIALIZE_MODE, hdc: ^HDC) -> HRESULT,
	ReleaseDC:             proc "stdcall" (this: ^IGdiInteropRenderTarget, update: ^RECT) -> HRESULT,
}


IDCRenderTarget_UUID_STRING := "1c51bc64-de61-46fd-9899-63a5d8f03950"
IDCRenderTarget_UUID := IID{0x1c51bc64, 0xde61, 0x46fd, {0x98, 0x99, 0x63, 0xa5, 0xd8, 0xf0, 0x39, 0x50}}
IDCRenderTarget :: struct #raw_union {
	#subtype irendertarget:       IRenderTarget,
	using idcrendertarget_vtable: IDCRenderTarget_VTable,
}
IDCRenderTarget_VTable :: struct {
	using irendertarget_vtable: IRenderTarget_VTable,
	BindDC:                     proc "stdcall" (this: ^IDCRenderTarget, hDC: HDC, #by_ptr pSubRect: RECT) -> HRESULT,
}


IFactory_UUID_STRING := "06152247-6f50-465a-9245-118bfd3b6007"
IFactory_UUID := IID{0x06152247, 0x6f50, 0x465a, {0x92, 0x45, 0x11, 0x8b, 0xfd, 0x3b, 0x60, 0x07}}
IFactory :: struct #raw_union {
	#subtype iunknown:     IUnknown,
	using ifactory_vtable: IFactory_VTable,
}
IFactory_VTable :: struct {
	using iunknown_vtable:          IUnknown_VTable,
	ReloadSystemMetrics:            proc "stdcall" (this: ^IFactory) -> HRESULT,
	GetDesktopDpi:                  proc "stdcall" (this: ^IFactory, dpiX: ^f32, dpiY: ^f32),
	CreateRectangleGeometry:        proc "stdcall" (this: ^IFactory, #by_ptr rectangle: RECT_F, rectangleGeometry: ^^IRectangleGeometry) -> HRESULT,
	CreateRoundedRectangleGeometry: proc "stdcall" (this: ^IFactory, #by_ptr roundedRectangle: ROUNDED_RECT, roundedRectangleGeometry: ^^IRoundedRectangleGeometry) -> HRESULT,
	CreateEllipseGeometry:          proc "stdcall" (this: ^IFactory, #by_ptr ellipse: ELLIPSE, ellipseGeometry: ^^IEllipseGeometry) -> HRESULT,
	CreateGeometryGroup:            proc "stdcall" (
		this: ^IFactory,
		fillMode: FILL_MODE,
		geometries: [^]^IGeometry,
		geometriesCount: u32,
		geometryGroup: ^^IGeometryGroup,
	) -> HRESULT,
	CreateTransformedGeometry:      proc "stdcall" (
		this: ^IFactory,
		sourceGeometry: ^IGeometry,
		#by_ptr transform: MATRIX_3X2_F,
		transformedGeometry: ^^ITransformedGeometry,
	) -> HRESULT,
	CreatePathGeometry:             proc "stdcall" (this: ^IFactory, pathGeometry: ^^IPathGeometry) -> HRESULT,
	CreateStrokeStyle:              proc "stdcall" (
		this: ^IFactory,
		#by_ptr strokeStyleProperties: STROKE_STYLE_PROPERTIES,
		dashes: [^]f32,
		dashesCount: u32,
		strokeStyle: ^^IStrokeStyle,
	) -> HRESULT,
	CreateDrawingStateBlock:        proc "stdcall" (
		this: ^IFactory,
		drawingStateDescription: ^DRAWING_STATE_DESCRIPTION,
		textRenderingParams: ^dwrite.IRenderingParams,
		drawingStateBlock: ^^IDrawingStateBlock,
	) -> HRESULT,
	CreateWicBitmapRenderTarget:    proc "stdcall" (
		this: ^IFactory,
		target: ^IWICBitmap,
		#by_ptr renderTargetProperties: RENDER_TARGET_PROPERTIES,
		renderTarget: ^^IRenderTarget,
	) -> HRESULT,
	CreateHwndRenderTarget:         proc "stdcall" (
		this: ^IFactory,
		#by_ptr renderTargetProperties: RENDER_TARGET_PROPERTIES,
		#by_ptr hwndRenderTargetProperties: HWND_RENDER_TARGET_PROPERTIES,
		hwndRenderTarget: ^^IHwndRenderTarget,
	) -> HRESULT,
	CreateDxgiSurfaceRenderTarget:  proc "stdcall" (
		this: ^IFactory,
		dxgiSurface: ^dxgi.ISurface,
		#by_ptr renderTargetProperties: RENDER_TARGET_PROPERTIES,
		renderTarget: ^^IRenderTarget,
	) -> HRESULT,
	CreateDCRenderTarget:           proc "stdcall" (this: ^IFactory, #by_ptr renderTargetProperties: RENDER_TARGET_PROPERTIES, dcRenderTarget: ^^IDCRenderTarget) -> HRESULT,
}

CHANNEL_SELECTOR :: enum u32 {
	R,
	G,
	B,
	A,
}

BITMAPSOURCE_ORIENTATION :: enum u32 {
	DEFAULT                             = 1,
	FLIP_HORIZONTAL                     = 2,
	ROTATE_CLOCKWISE180                 = 3,
	ROTATE_CLOCKWISE180_FLIP_HORIZONTAL = 4,
	ROTATE_CLOCKWISE270_FLIP_HORIZONTAL = 5,
	ROTATE_CLOCKWISE90                  = 6,
	ROTATE_CLOCKWISE90_FLIP_HORIZONTAL  = 7,
	ROTATE_CLOCKWISE270                 = 8,
}

GAUSSIANBLUR_PROP :: enum u32 {
	STANDARD_DEVIATION,
	OPTIMIZATION,
	BORDER_MODE,
}

GAUSSIANBLUR_OPTIMIZATION :: enum u32 {
	SPEED,
	BALANCED,
	QUALITY,
}

DIRECTIONALBLUR_PROP :: enum u32 {
	STANDARD_DEVIATION,
	ANGLE,
	OPTIMIZATION,
	BORDER_MODE,
}

DIRECTIONALBLUR_OPTIMIZATION :: enum u32 {
	SPEED,
	BALANCED,
	QUALITY,
}

SHADOW_PROP :: enum u32 {
	BLUR_STANDARD_DEVIATION,
	COLOR,
	OPTIMIZATION,
}

SHADOW_OPTIMIZATION :: enum u32 {
	SPEED,
	BALANCED,
	QUALITY,
}

BLEND_PROP :: enum u32 {
	MODE,
}

SATURATION_PROP :: enum u32 {
	SATURATION,
}

HUEROTATION_PROP :: enum u32 {
	ANGLE,
}

COLORMATRIX_PROP :: enum u32 {
	COLOR_MATRIX,
	ALPHA_MODE,
	CLAMP_OUTPUT,
}

BITMAPSOURCE_PROP :: enum u32 {
	WIC_BITMAP_SOURCE,
	SCALE,
	INTERPOLATION_MODE,
	ENABLE_DPI_CORRECTION,
	ALPHA_MODE,
	ORIENTATION,
}

BITMAPSOURCE_INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR = 0,
	LINEAR           = 1,
	CUBIC            = 2,
	FANT             = 6,
	MIPMAP_LINEAR    = 7,
}

BITMAPSOURCE_ALPHA_MODE :: enum u32 {
	PREMULTIPLIED = 1,
	STRAIGHT      = 2,
}

COMPOSITE_PROP :: enum u32 {
	MODE,
}

_3DTRANSFORM_PROP :: enum u32 {
	INTERPOLATION_MODE,
	BORDER_MODE,
	TRANSFORM_MATRIX,
}

_3DTRANSFORM_INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
}

_3DPERSPECTIVETRANSFORM_PROP :: enum u32 {
	INTERPOLATION_MODE,
	BORDER_MODE,
	DEPTH,
	PERSPECTIVE_ORIGIN,
	LOCAL_OFFSET,
	GLOBAL_OFFSET,
	ROTATION_ORIGIN,
	ROTATION,
}

_3DPERSPECTIVETRANSFORM_INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
}

_2DAFFINETRANSFORM_PROP :: enum u32 {
	INTERPOLATION_MODE,
	BORDER_MODE,
	TRANSFORM_MATRIX,
	SHARPNESS,
}

DPICOMPENSATION_PROP :: enum u32 {
	INTERPOLATION_MODE,
	BORDER_MODE,
	INPUT_DPI,
}

DPICOMPENSATION_INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

SCALE_PROP :: enum u32 {
	SCALE,
	CENTER_POINT,
	INTERPOLATION_MODE,
	BORDER_MODE,
	SHARPNESS,
}

SCALE_INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

TURBULENCE_PROP :: enum u32 {
	OFFSET,
	SIZE,
	BASE_FREQUENCY,
	NUM_OCTAVES,
	SEED,
	NOISE,
	STITCHABLE,
}

DISPLACEMENTMAP_PROP :: enum u32 {
	SCALE,
	X_CHANNEL_SELECT,
	Y_CHANNEL_SELECT,
}

COLORMANAGEMENT_PROP :: enum u32 {
	SOURCE_COLOR_CONTEXT,
	SOURCE_RENDERING_INTENT,
	DESTINATION_COLOR_CONTEXT,
	DESTINATION_RENDERING_INTENT,
	ALPHA_MODE,
	QUALITY,
}

COLORMANAGEMENT_ALPHA_MODE :: enum u32 {
	PREMULTIPLIED = 1,
	STRAIGHT      = 2,
}

COLORMANAGEMENT_QUALITY :: enum u32 {
	PROOF,
	NORMAL,
	BEST,
}

COLORMANAGEMENT_RENDERING_INTENT :: enum u32 {
	PERCEPTUAL,
	RELATIVE_COLORIMETRIC,
	SATURATION,
	ABSOLUTE_COLORIMETRIC,
}

HISTOGRAM_PROP :: enum u32 {
	NUM_BINS,
	CHANNEL_SELECT,
	HISTOGRAM_OUTPUT,
}

POINTSPECULAR_PROP :: enum u32 {
	LIGHT_POSITION,
	SPECULAR_EXPONENT,
	SPECULAR_CONSTANT,
	SURFACE_SCALE,
	COLOR,
	KERNEL_UNIT_LENGTH,
	SCALE_MODE,
}

POINTSPECULAR_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

SPOTSPECULAR_PROP :: enum u32 {
	LIGHT_POSITION,
	POINTS_AT,
	FOCUS,
	LIMITING_CONE_ANGLE,
	SPECULAR_EXPONENT,
	SPECULAR_CONSTANT,
	SURFACE_SCALE,
	COLOR,
	KERNEL_UNIT_LENGTH,
	SCALE_MODE,
}

SPOTSPECULAR_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

DISTANTSPECULAR_PROP :: enum u32 {
	AZIMUTH,
	ELEVATION,
	SPECULAR_EXPONENT,
	SPECULAR_CONSTANT,
	SURFACE_SCALE,
	COLOR,
	KERNEL_UNIT_LENGTH,
	SCALE_MODE,
}

DISTANTSPECULAR_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

POINTDIFFUSE_PROP :: enum u32 {
	LIGHT_POSITION,
	DIFFUSE_CONSTANT,
	SURFACE_SCALE,
	COLOR,
	KERNEL_UNIT_LENGTH,
	SCALE_MODE,
}

POINTDIFFUSE_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

SPOTDIFFUSE_PROP :: enum u32 {
	LIGHT_POSITION,
	POINTS_AT,
	FOCUS,
	LIMITING_CONE_ANGLE,
	DIFFUSE_CONSTANT,
	SURFACE_SCALE,
	COLOR,
	KERNEL_UNIT_LENGTH,
	SCALE_MODE,
}

SPOTDIFFUSE_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

DISTANTDIFFUSE_PROP :: enum u32 {
	AZIMUTH,
	ELEVATION,
	DIFFUSE_CONSTANT,
	SURFACE_SCALE,
	COLOR,
	KERNEL_UNIT_LENGTH,
	SCALE_MODE,
}

DISTANTDIFFUSE_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

FLOOD_PROP :: enum u32 {
	COLOR,
}

LINEARTRANSFER_PROP :: enum u32 {
	RED_Y_INTERCEPT,
	RED_SLOPE,
	RED_DISABLE,
	GREEN_Y_INTERCEPT,
	GREEN_SLOPE,
	GREEN_DISABLE,
	BLUE_Y_INTERCEPT,
	BLUE_SLOPE,
	BLUE_DISABLE,
	ALPHA_Y_INTERCEPT,
	ALPHA_SLOPE,
	ALPHA_DISABLE,
	CLAMP_OUTPUT,
}

GAMMATRANSFER_PROP :: enum u32 {
	RED_AMPLITUDE,
	RED_EXPONENT,
	RED_OFFSET,
	RED_DISABLE,
	GREEN_AMPLITUDE,
	GREEN_EXPONENT,
	GREEN_OFFSET,
	GREEN_DISABLE,
	BLUE_AMPLITUDE,
	BLUE_EXPONENT,
	BLUE_OFFSET,
	BLUE_DISABLE,
	ALPHA_AMPLITUDE,
	ALPHA_EXPONENT,
	ALPHA_OFFSET,
	ALPHA_DISABLE,
	CLAMP_OUTPUT,
}

TABLETRANSFER_PROP :: enum u32 {
	RED_TABLE,
	RED_DISABLE,
	GREEN_TABLE,
	GREEN_DISABLE,
	BLUE_TABLE,
	BLUE_DISABLE,
	ALPHA_TABLE,
	ALPHA_DISABLE,
	CLAMP_OUTPUT,
}

DISCRETETRANSFER_PROP :: enum u32 {
	RED_TABLE,
	RED_DISABLE,
	GREEN_TABLE,
	GREEN_DISABLE,
	BLUE_TABLE,
	BLUE_DISABLE,
	ALPHA_TABLE,
	ALPHA_DISABLE,
	CLAMP_OUTPUT,
}

CONVOLVEMATRIX_PROP :: enum u32 {
	KERNEL_UNIT_LENGTH,
	SCALE_MODE,
	KERNEL_SIZE_X,
	KERNEL_SIZE_Y,
	KERNEL_MATRIX,
	DIVISOR,
	BIAS,
	KERNEL_OFFSET,
	PRESERVE_ALPHA,
	BORDER_MODE,
	CLAMP_OUTPUT,
}

CONVOLVEMATRIX_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

BRIGHTNESS_PROP :: enum u32 {
	WHITE_POINT,
	BLACK_POINT,
}

ARITHMETICCOMPOSITE_PROP :: enum u32 {
	COEFFICIENTS,
	CLAMP_OUTPUT,
}

CROP_PROP :: enum u32 {
	RECT,
	BORDER_MODE,
}

BORDER_PROP :: enum u32 {
	EDGE_MODE_X,
	EDGE_MODE_Y,
}

BORDER_EDGE_MODE :: enum u32 {
	CLAMP,
	WRAP,
	MIRROR,
}

MORPHOLOGY_PROP :: enum u32 {
	MODE,
	WIDTH,
	HEIGHT,
}

MORPHOLOGY_MODE :: enum u32 {
	ERODE,
	DILATE,
}

TILE_PROP :: enum u32 {
	RECT,
}

ATLAS_PROP :: enum u32 {
	INPUT_RECT,
	INPUT_PADDING_RECT,
}

OPACITYMETADATA_PROP :: enum u32 {
	INPUT_OPAQUE_RECT,
}

EFFECT_FACTORY :: #type proc "stdcall" (effectImpl: ^^IUnknown) -> HRESULT

PROPERTY_TYPE :: enum u32 {
	UNKNOWN,
	STRING,
	BOOL,
	UINT32,
	INT32,
	FLOAT,
	VECTOR2,
	VECTOR3,
	VECTOR4,
	BLOB,
	IUNKNOWN,
	ENUM,
	ARRAY,
	CLSID,
	MATRIX_3X2,
	MATRIX_4X3,
	MATRIX_4X4,
	MATRIX_5X4,
	COLOR_CONTEXT,
}

PROPERTY :: enum u32 {
	CLSID       = 2147483648,
	DISPLAYNAME = 2147483649,
	AUTHOR      = 2147483650,
	CATEGORY    = 2147483651,
	DESCRIPTION = 2147483652,
	INPUTS      = 2147483653,
	CACHED      = 2147483654,
	PRECISION   = 2147483655,
	MIN_INPUTS  = 2147483656,
	MAX_INPUTS  = 2147483657,
}

SUBPROPERTY :: enum u32 {
	DISPLAYNAME = 2147483648,
	ISREADONLY  = 2147483649,
	MIN         = 2147483650,
	MAX         = 2147483651,
	DEFAULT     = 2147483652,
	FIELDS      = 2147483653,
	INDEX       = 2147483654,
}

BITMAP_OPTIONS_Flag :: enum {
	TARGET         = 1,
	CANNOT_DRAW    = 2,
	CPU_READ       = 4,
	GDI_COMPATIBLE = 8,
}
BITMAP_OPTIONS :: bit_set[BITMAP_OPTIONS_Flag;u32]

BUFFER_PRECISION :: enum u32 {
	_UNKNOWN,
	_8BPC_UNORM,
	_8BPC_UNORM_SRGB,
	_16BPC_UNORM,
	_16BPC_FLOAT,
	_32BPC_FLOAT,
}

MAP_OPTIONS_Flag :: enum {
	READ    = 1,
	WRITE   = 2,
	DISCARD = 4,
}
MAP_OPTIONS :: bit_set[MAP_OPTIONS_Flag;u32]

INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

UNIT_MODE :: enum u32 {
	DIPS,
	PIXELS,
}

COLOR_SPACE :: enum u32 {
	CUSTOM,
	SRGB,
	SCRGB,
}

DEVICE_CONTEXT_OPTIONS_Flag :: enum {
	ENABLE_MULTITHREADED_OPTIMIZATIONS = 1,
}
DEVICE_CONTEXT_OPTIONS :: bit_set[DEVICE_CONTEXT_OPTIONS_Flag;u32]

STROKE_TRANSFORM_TYPE :: enum u32 {
	NORMAL,
	FIXED,
	HAIRLINE,
}

PRIMITIVE_BLEND :: enum u32 {
	SOURCE_OVER,
	COPY,
	MIN,
	ADD,
	MAX,
}

THREADING_MODE :: enum u32 {
	SINGLE_THREADED,
	MULTI_THREADED,
}

COLOR_INTERPOLATION_MODE :: enum u32 {
	STRAIGHT,
	PREMULTIPLIED,
}

BITMAP_PROPERTIES1 :: struct {
	pixelFormat:   PIXEL_FORMAT,
	dpiX:          f32,
	dpiY:          f32,
	bitmapOptions: BITMAP_OPTIONS,
	colorContext:  ^IColorContext,
}

MAPPED_RECT :: struct {
	pitch: u32,
	bits:  ^u8,
}

RENDERING_CONTROLS :: struct {
	bufferPrecision: BUFFER_PRECISION,
	tileSize:        SIZE_U,
}

EFFECT_INPUT_DESCRIPTION :: struct {
	effect:         ^IEffect,
	inputIndex:     u32,
	inputRectangle: RECT_F,
}

POINT_DESCRIPTION :: struct {
	point:              POINT_2F,
	unitTangentVector:  POINT_2F,
	endSegment:         u32,
	endFigure:          u32,
	lengthToEndSegment: f32,
}

IMAGE_BRUSH_PROPERTIES :: struct {
	sourceRectangle:   RECT_F,
	extendModeX:       EXTEND_MODE,
	extendModeY:       EXTEND_MODE,
	interpolationMode: INTERPOLATION_MODE,
}

BITMAP_BRUSH_PROPERTIES1 :: struct {
	extendModeX:       EXTEND_MODE,
	extendModeY:       EXTEND_MODE,
	interpolationMode: INTERPOLATION_MODE,
}

STROKE_STYLE_PROPERTIES1 :: struct {
	startCap:      CAP_STYLE,
	endCap:        CAP_STYLE,
	dashCap:       CAP_STYLE,
	lineJoin:      LINE_JOIN,
	miterLimit:    f32,
	dashStyle:     DASH_STYLE,
	dashOffset:    f32,
	transformType: STROKE_TRANSFORM_TYPE,
}

LAYER_OPTIONS1_Flag :: enum {
	INITIALIZE_FROM_BACKGROUND = 1,
	IGNORE_ALPHA               = 2,
}
LAYER_OPTIONS1 :: bit_set[LAYER_OPTIONS1_Flag;u32]

LAYER_PARAMETERS1 :: struct {
	contentBounds:     RECT_F,
	geometricMask:     ^IGeometry,
	maskAntialiasMode: ANTIALIAS_MODE,
	maskTransform:     MATRIX_3X2_F,
	opacity:           f32,
	opacityBrush:      ^IBrush,
	layerOptions:      LAYER_OPTIONS1,
}

PRINT_FONT_SUBSET_MODE :: enum u32 {
	DEFAULT,
	EACHPAGE,
	NONE,
}

DRAWING_STATE_DESCRIPTION1 :: struct {
	antialiasMode:     ANTIALIAS_MODE,
	textAntialiasMode: TEXT_ANTIALIAS_MODE,
	tag1:              u64,
	tag2:              u64,
	transform:         MATRIX_3X2_F,
	primitiveBlend:    PRIMITIVE_BLEND,
	unitMode:          UNIT_MODE,
}

PRINT_CONTROL_PROPERTIES :: struct {
	fontSubset: PRINT_FONT_SUBSET_MODE,
	rasterDPI:  f32,
	colorSpace: COLOR_SPACE,
}

CREATION_PROPERTIES :: struct {
	threadingMode: THREADING_MODE,
	debugLevel:    DEBUG_LEVEL,
	options:       DEVICE_CONTEXT_OPTIONS,
}

IGdiMetafileSink_UUID_STRING := "82237326-8111-4f7c-bcf4-b5c1175564fe"
IGdiMetafileSink_UUID := IID{0x82237326, 0x8111, 0x4f7c, {0xbc, 0xf4, 0xb5, 0xc1, 0x17, 0x55, 0x64, 0xfe}}
IGdiMetafileSink :: struct #raw_union {
	#subtype iunknown:             IUnknown,
	using igdimetafilesink_vtable: IGdiMetafileSink_VTable,
}
IGdiMetafileSink_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	ProcessRecord:         proc "stdcall" (this: ^IGdiMetafileSink, recordType: u32, recordData: rawptr, recordDataSize: u32) -> HRESULT,
}


IGdiMetafile_UUID_STRING := "2f543dc3-cfc1-4211-864f-cfd91c6f3395"
IGdiMetafile_UUID := IID{0x2f543dc3, 0xcfc1, 0x4211, {0x86, 0x4f, 0xcf, 0xd9, 0x1c, 0x6f, 0x33, 0x95}}
IGdiMetafile :: struct #raw_union {
	#subtype iresource:        IResource,
	using igdimetafile_vtable: IGdiMetafile_VTable,
}
IGdiMetafile_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	Stream:                 proc "stdcall" (this: ^IGdiMetafile, sink: ^IGdiMetafileSink) -> HRESULT,
	GetBounds:              proc "stdcall" (this: ^IGdiMetafile, bounds: ^RECT_F) -> HRESULT,
}


ICommandSink_UUID_STRING := "54d7898a-a061-40a7-bec7-e465bcba2c4f"
ICommandSink_UUID := IID{0x54d7898a, 0xa061, 0x40a7, {0xbe, 0xc7, 0xe4, 0x65, 0xbc, 0xba, 0x2c, 0x4f}}
ICommandSink :: struct #raw_union {
	#subtype iunknown:         IUnknown,
	using icommandsink_vtable: ICommandSink_VTable,
}
ICommandSink_VTable :: struct {
	using iunknown_vtable:  IUnknown_VTable,
	BeginDraw:              proc "stdcall" (this: ^ICommandSink) -> HRESULT,
	EndDraw:                proc "stdcall" (this: ^ICommandSink) -> HRESULT,
	SetAntialiasMode:       proc "stdcall" (this: ^ICommandSink, antialiasMode: ANTIALIAS_MODE) -> HRESULT,
	SetTags:                proc "stdcall" (this: ^ICommandSink, tag1: u64, tag2: u64) -> HRESULT,
	SetTextAntialiasMode:   proc "stdcall" (this: ^ICommandSink, textAntialiasMode: TEXT_ANTIALIAS_MODE) -> HRESULT,
	SetTextRenderingParams: proc "stdcall" (this: ^ICommandSink, textRenderingParams: ^dwrite.IRenderingParams) -> HRESULT,
	SetTransform:           proc "stdcall" (this: ^ICommandSink, #by_ptr transform: MATRIX_3X2_F) -> HRESULT,
	SetPrimitiveBlend:      proc "stdcall" (this: ^ICommandSink, primitiveBlend: PRIMITIVE_BLEND) -> HRESULT,
	SetUnitMode:            proc "stdcall" (this: ^ICommandSink, unitMode: UNIT_MODE) -> HRESULT,
	Clear:                  proc "stdcall" (this: ^ICommandSink, color: ^COLOR_F) -> HRESULT,
	DrawGlyphRun:           proc "stdcall" (
		this: ^ICommandSink,
		baselineOrigin: POINT_2F,
		#by_ptr glyphRun: dwrite.GLYPH_RUN,
		glyphRunDescription: ^dwrite.GLYPH_RUN_DESCRIPTION,
		foregroundBrush: ^IBrush,
		measuringMode: dwrite.MEASURING_MODE,
	) -> HRESULT,
	DrawLine:               proc "stdcall" (this: ^ICommandSink, point0: POINT_2F, point1: POINT_2F, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle) -> HRESULT,
	DrawGeometry:           proc "stdcall" (this: ^ICommandSink, geometry: ^IGeometry, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle) -> HRESULT,
	DrawRectangle:          proc "stdcall" (this: ^ICommandSink, #by_ptr rect: RECT_F, brush: ^IBrush, strokeWidth: f32, strokeStyle: ^IStrokeStyle) -> HRESULT,
	DrawBitmap:             proc "stdcall" (
		this: ^ICommandSink,
		bitmap: ^IBitmap,
		destinationRectangle: ^RECT_F,
		opacity: f32,
		interpolationMode: INTERPOLATION_MODE,
		sourceRectangle: ^RECT_F,
		perspectiveTransform: ^d2d_common.MATRIX_4X4_F,
	) -> HRESULT,
	DrawImage:              proc "stdcall" (
		this: ^ICommandSink,
		image: ^IImage,
		targetOffset: ^POINT_2F,
		imageRectangle: ^RECT_F,
		interpolationMode: INTERPOLATION_MODE,
		compositeMode: d2d_common.COMPOSITE_MODE,
	) -> HRESULT,
	DrawGdiMetafile:        proc "stdcall" (this: ^ICommandSink, gdiMetafile: ^IGdiMetafile, targetOffset: ^POINT_2F) -> HRESULT,
	FillMesh:               proc "stdcall" (this: ^ICommandSink, mesh: ^IMesh, brush: ^IBrush) -> HRESULT,
	FillOpacityMask:        proc "stdcall" (this: ^ICommandSink, opacityMask: ^IBitmap, brush: ^IBrush, destinationRectangle: ^RECT_F, sourceRectangle: ^RECT_F) -> HRESULT,
	FillGeometry:           proc "stdcall" (this: ^ICommandSink, geometry: ^IGeometry, brush: ^IBrush, opacityBrush: ^IBrush) -> HRESULT,
	FillRectangle:          proc "stdcall" (this: ^ICommandSink, #by_ptr rect: RECT_F, brush: ^IBrush) -> HRESULT,
	PushAxisAlignedClip:    proc "stdcall" (this: ^ICommandSink, #by_ptr clipRect: RECT_F, antialiasMode: ANTIALIAS_MODE) -> HRESULT,
	PushLayer:              proc "stdcall" (this: ^ICommandSink, #by_ptr layerParameters1: LAYER_PARAMETERS1, layer: ^ILayer) -> HRESULT,
	PopAxisAlignedClip:     proc "stdcall" (this: ^ICommandSink) -> HRESULT,
	PopLayer:               proc "stdcall" (this: ^ICommandSink) -> HRESULT,
}


ICommandList_UUID_STRING := "b4f34a19-2383-4d76-94f6-ec343657c3dc"
ICommandList_UUID := IID{0xb4f34a19, 0x2383, 0x4d76, {0x94, 0xf6, 0xec, 0x34, 0x36, 0x57, 0xc3, 0xdc}}
ICommandList :: struct #raw_union {
	#subtype iimage:           IImage,
	using icommandlist_vtable: ICommandList_VTable,
}
ICommandList_VTable :: struct {
	using iimage_vtable: IImage_VTable,
	Stream:              proc "stdcall" (this: ^ICommandList, sink: ^ICommandSink) -> HRESULT,
	Close:               proc "stdcall" (this: ^ICommandList) -> HRESULT,
}


IPrintControl_UUID_STRING := "2c1d867d-c290-41c8-ae7e-34a98702e9a5"
IPrintControl_UUID := IID{0x2c1d867d, 0xc290, 0x41c8, {0xae, 0x7e, 0x34, 0xa9, 0x87, 0x02, 0xe9, 0xa5}}
IPrintControl :: struct #raw_union {
	#subtype iunknown:          IUnknown,
	using iprintcontrol_vtable: IPrintControl_VTable,
}
IPrintControl_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AddPage:               proc "stdcall" (this: ^IPrintControl, commandList: ^ICommandList, pageSize: SIZE_F, pagePrintTicketStream: ^IStream, tag1: ^u64, tag2: ^u64) -> HRESULT,
	Close:                 proc "stdcall" (this: ^IPrintControl) -> HRESULT,
}


IImageBrush_UUID_STRING := "fe9e984d-3f95-407c-b5db-cb94d4e8f87c"
IImageBrush_UUID := IID{0xfe9e984d, 0x3f95, 0x407c, {0xb5, 0xdb, 0xcb, 0x94, 0xd4, 0xe8, 0xf8, 0x7c}}
IImageBrush :: struct #raw_union {
	#subtype ibrush:          IBrush,
	using iimagebrush_vtable: IImageBrush_VTable,
}
IImageBrush_VTable :: struct {
	using ibrush_vtable:  IBrush_VTable,
	SetImage:             proc "stdcall" (this: ^IImageBrush, image: ^IImage),
	SetExtendModeX:       proc "stdcall" (this: ^IImageBrush, extendModeX: EXTEND_MODE),
	SetExtendModeY:       proc "stdcall" (this: ^IImageBrush, extendModeY: EXTEND_MODE),
	SetInterpolationMode: proc "stdcall" (this: ^IImageBrush, interpolationMode: INTERPOLATION_MODE),
	SetSourceRectangle:   proc "stdcall" (this: ^IImageBrush, #by_ptr sourceRectangle: RECT_F),
	GetImage:             proc "stdcall" (this: ^IImageBrush, image: ^^IImage),
	GetExtendModeX:       proc "stdcall" (this: ^IImageBrush) -> EXTEND_MODE,
	GetExtendModeY:       proc "stdcall" (this: ^IImageBrush) -> EXTEND_MODE,
	GetInterpolationMode: proc "stdcall" (this: ^IImageBrush) -> INTERPOLATION_MODE,
	GetSourceRectangle:   proc "stdcall" (this: ^IImageBrush, sourceRectangle: ^RECT_F),
}


IBitmapBrush1_UUID_STRING := "41343a53-e41a-49a2-91cd-21793bbb62e5"
IBitmapBrush1_UUID := IID{0x41343a53, 0xe41a, 0x49a2, {0x91, 0xcd, 0x21, 0x79, 0x3b, 0xbb, 0x62, 0xe5}}
IBitmapBrush1 :: struct #raw_union {
	#subtype ibitmapbrush:      IBitmapBrush,
	using ibitmapbrush1_vtable: IBitmapBrush1_VTable,
}
IBitmapBrush1_VTable :: struct {
	using ibitmapbrush_vtable: IBitmapBrush_VTable,
	SetInterpolationMode1:     proc "stdcall" (this: ^IBitmapBrush1, interpolationMode: INTERPOLATION_MODE),
	GetInterpolationMode1:     proc "stdcall" (this: ^IBitmapBrush1) -> INTERPOLATION_MODE,
}


IStrokeStyle1_UUID_STRING := "10a72a66-e91c-43f4-993f-ddf4b82b0b4a"
IStrokeStyle1_UUID := IID{0x10a72a66, 0xe91c, 0x43f4, {0x99, 0x3f, 0xdd, 0xf4, 0xb8, 0x2b, 0x0b, 0x4a}}
IStrokeStyle1 :: struct #raw_union {
	#subtype istrokestyle:      IStrokeStyle,
	using istrokestyle1_vtable: IStrokeStyle1_VTable,
}
IStrokeStyle1_VTable :: struct {
	using istrokestyle_vtable: IStrokeStyle_VTable,
	GetStrokeTransformType:    proc "stdcall" (this: ^IStrokeStyle1) -> STROKE_TRANSFORM_TYPE,
}


IPathGeometry1_UUID_STRING := "62baa2d2-ab54-41b7-b872-787e0106a421"
IPathGeometry1_UUID := IID{0x62baa2d2, 0xab54, 0x41b7, {0xb8, 0x72, 0x78, 0x7e, 0x01, 0x06, 0xa4, 0x21}}
IPathGeometry1 :: struct #raw_union {
	#subtype ipathgeometry:      IPathGeometry,
	using ipathgeometry1_vtable: IPathGeometry1_VTable,
}
IPathGeometry1_VTable :: struct {
	using ipathgeometry_vtable:     IPathGeometry_VTable,
	ComputePointAndSegmentAtLength: proc "stdcall" (
		this: ^IPathGeometry1,
		length: f32,
		startSegment: u32,
		worldTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		pointDescription: ^POINT_DESCRIPTION,
	) -> HRESULT,
}


IProperties_UUID_STRING := "483473d7-cd46-4f9d-9d3a-3112aa80159d"
IProperties_UUID := IID{0x483473d7, 0xcd46, 0x4f9d, {0x9d, 0x3a, 0x31, 0x12, 0xaa, 0x80, 0x15, 0x9d}}
IProperties :: struct #raw_union {
	#subtype iunknown:        IUnknown,
	using iproperties_vtable: IProperties_VTable,
}
IProperties_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetPropertyCount:      proc "stdcall" (this: ^IProperties) -> u32,
	GetPropertyName:       proc "stdcall" (this: ^IProperties, index: u32, name: [^]u8, nameCount: u32) -> HRESULT,
	GetPropertyNameLength: proc "stdcall" (this: ^IProperties, index: u32) -> u32,
	GetType:               proc "stdcall" (this: ^IProperties, index: u32) -> PROPERTY_TYPE,
	GetPropertyIndex:      proc "stdcall" (this: ^IProperties, name: PWSTR) -> u32,
	SetValueByName:        proc "stdcall" (this: ^IProperties, name: PWSTR, type: PROPERTY_TYPE, data: [^]u8, dataSize: u32) -> HRESULT,
	SetValue:              proc "stdcall" (this: ^IProperties, index: u32, type: PROPERTY_TYPE, data: [^]u8, dataSize: u32) -> HRESULT,
	GetValueByName:        proc "stdcall" (this: ^IProperties, name: PWSTR, type: PROPERTY_TYPE, data: [^]u8, dataSize: u32) -> HRESULT,
	GetValue:              proc "stdcall" (this: ^IProperties, index: u32, type: PROPERTY_TYPE, data: [^]u8, dataSize: u32) -> HRESULT,
	GetValueSize:          proc "stdcall" (this: ^IProperties, index: u32) -> u32,
	GetSubProperties:      proc "stdcall" (this: ^IProperties, index: u32, subProperties: ^^IProperties) -> HRESULT,
}


IEffect_UUID_STRING := "28211a43-7d89-476f-8181-2d6159b220ad"
IEffect_UUID := IID{0x28211a43, 0x7d89, 0x476f, {0x81, 0x81, 0x2d, 0x61, 0x59, 0xb2, 0x20, 0xad}}
IEffect :: struct #raw_union {
	#subtype iproperties: IProperties,
	using ieffect_vtable: IEffect_VTable,
}
IEffect_VTable :: struct {
	using iproperties_vtable: IProperties_VTable,
	SetInput:                 proc "stdcall" (this: ^IEffect, index: u32, input: ^IImage, invalidate: BOOL),
	SetInputCount:            proc "stdcall" (this: ^IEffect, inputCount: u32) -> HRESULT,
	GetInput:                 proc "stdcall" (this: ^IEffect, index: u32, input: ^^IImage),
	GetInputCount:            proc "stdcall" (this: ^IEffect) -> u32,
	GetOutput:                proc "stdcall" (this: ^IEffect, outputImage: ^^IImage),
}


IBitmap1_UUID_STRING := "a898a84c-3873-4588-b08b-ebbf978df041"
IBitmap1_UUID := IID{0xa898a84c, 0x3873, 0x4588, {0xb0, 0x8b, 0xeb, 0xbf, 0x97, 0x8d, 0xf0, 0x41}}
IBitmap1 :: struct #raw_union {
	#subtype ibitmap:      IBitmap,
	using ibitmap1_vtable: IBitmap1_VTable,
}
IBitmap1_VTable :: struct {
	using ibitmap_vtable: IBitmap_VTable,
	GetColorContext:      proc "stdcall" (this: ^IBitmap1, colorContext: ^^IColorContext),
	GetOptions:           proc "stdcall" (this: ^IBitmap1) -> BITMAP_OPTIONS,
	GetSurface:           proc "stdcall" (this: ^IBitmap1, dxgiSurface: ^^dxgi.ISurface) -> HRESULT,
	Map:                  proc "stdcall" (this: ^IBitmap1, options: MAP_OPTIONS, mappedRect: ^MAPPED_RECT) -> HRESULT,
	Unmap:                proc "stdcall" (this: ^IBitmap1) -> HRESULT,
}


IColorContext_UUID_STRING := "1c4820bb-5771-4518-a581-2fe4dd0ec657"
IColorContext_UUID := IID{0x1c4820bb, 0x5771, 0x4518, {0xa5, 0x81, 0x2f, 0xe4, 0xdd, 0x0e, 0xc6, 0x57}}
IColorContext :: struct #raw_union {
	#subtype iresource:         IResource,
	using icolorcontext_vtable: IColorContext_VTable,
}
IColorContext_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	GetColorSpace:          proc "stdcall" (this: ^IColorContext) -> COLOR_SPACE,
	GetProfileSize:         proc "stdcall" (this: ^IColorContext) -> u32,
	GetProfile:             proc "stdcall" (this: ^IColorContext, profile: [^]u8, profileSize: u32) -> HRESULT,
}


IGradientStopCollection1_UUID_STRING := "ae1572f4-5dd0-4777-998b-9279472ae63b"
IGradientStopCollection1_UUID := IID{0xae1572f4, 0x5dd0, 0x4777, {0x99, 0x8b, 0x92, 0x79, 0x47, 0x2a, 0xe6, 0x3b}}
IGradientStopCollection1 :: struct #raw_union {
	#subtype igradientstopcollection:      IGradientStopCollection,
	using igradientstopcollection1_vtable: IGradientStopCollection1_VTable,
}
IGradientStopCollection1_VTable :: struct {
	using igradientstopcollection_vtable: IGradientStopCollection_VTable,
	GetGradientStops1:                    proc "stdcall" (this: ^IGradientStopCollection1, gradientStops: [^]GRADIENT_STOP, gradientStopsCount: u32),
	GetPreInterpolationSpace:             proc "stdcall" (this: ^IGradientStopCollection1) -> COLOR_SPACE,
	GetPostInterpolationSpace:            proc "stdcall" (this: ^IGradientStopCollection1) -> COLOR_SPACE,
	GetBufferPrecision:                   proc "stdcall" (this: ^IGradientStopCollection1) -> BUFFER_PRECISION,
	GetColorInterpolationMode:            proc "stdcall" (this: ^IGradientStopCollection1) -> COLOR_INTERPOLATION_MODE,
}


IDrawingStateBlock1_UUID_STRING := "689f1f85-c72e-4e33-8f19-85754efd5ace"
IDrawingStateBlock1_UUID := IID{0x689f1f85, 0xc72e, 0x4e33, {0x8f, 0x19, 0x85, 0x75, 0x4e, 0xfd, 0x5a, 0xce}}
IDrawingStateBlock1 :: struct #raw_union {
	#subtype idrawingstateblock:      IDrawingStateBlock,
	using idrawingstateblock1_vtable: IDrawingStateBlock1_VTable,
}
IDrawingStateBlock1_VTable :: struct {
	using idrawingstateblock_vtable: IDrawingStateBlock_VTable,
	GetDescription:                  proc "stdcall" (this: ^IDrawingStateBlock1, stateDescription: ^DRAWING_STATE_DESCRIPTION1),
	SetDescription:                  proc "stdcall" (this: ^IDrawingStateBlock1, #by_ptr stateDescription: DRAWING_STATE_DESCRIPTION1),
}


IDeviceContext_UUID_STRING := "e8f7fe7a-191c-466d-ad95-975678bda998"
IDeviceContext_UUID := IID{0xe8f7fe7a, 0x191c, 0x466d, {0xad, 0x95, 0x97, 0x56, 0x78, 0xbd, 0xa9, 0x98}}
IDeviceContext :: struct #raw_union {
	#subtype irendertarget:      IRenderTarget,
	using idevicecontext_vtable: IDeviceContext_VTable,
}
IDeviceContext_VTable :: struct {
	using irendertarget_vtable:            IRenderTarget_VTable,
	CreateBitmap1:                         proc "stdcall" (
		this: ^IDeviceContext,
		size: SIZE_U,
		sourceData: rawptr,
		pitch: u32,
		#by_ptr bitmapProperties: BITMAP_PROPERTIES1,
		bitmap: ^^IBitmap1,
	) -> HRESULT,
	CreateBitmapFromWicBitmap1:            proc "stdcall" (
		this: ^IDeviceContext,
		wicBitmapSource: ^IWICBitmapSource,
		bitmapProperties: ^BITMAP_PROPERTIES1,
		bitmap: ^^IBitmap1,
	) -> HRESULT,
	CreateColorContext:                    proc "stdcall" (this: ^IDeviceContext, space: COLOR_SPACE, profile: [^]u8, profileSize: u32, colorContext: ^^IColorContext) -> HRESULT,
	CreateColorContextFromFilename:        proc "stdcall" (this: ^IDeviceContext, filename: PWSTR, colorContext: ^^IColorContext) -> HRESULT,
	CreateColorContextFromWicColorContext: proc "stdcall" (this: ^IDeviceContext, wicColorContext: ^IWICColorContext, colorContext: ^^IColorContext) -> HRESULT,
	CreateBitmapFromDxgiSurface:           proc "stdcall" (this: ^IDeviceContext, surface: ^dxgi.ISurface, bitmapProperties: ^BITMAP_PROPERTIES1, bitmap: ^^IBitmap1) -> HRESULT,
	CreateEffect:                          proc "stdcall" (this: ^IDeviceContext, #by_ptr effectId: IID, effect: ^^IEffect) -> HRESULT,
	CreateGradientStopCollection1:         proc "stdcall" (
		this: ^IDeviceContext,
		straightAlphaGradientStops: [^]GRADIENT_STOP,
		straightAlphaGradientStopsCount: u32,
		preInterpolationSpace: COLOR_SPACE,
		postInterpolationSpace: COLOR_SPACE,
		bufferPrecision: BUFFER_PRECISION,
		extendMode: EXTEND_MODE,
		colorInterpolationMode: COLOR_INTERPOLATION_MODE,
		gradientStopCollection1: ^^IGradientStopCollection1,
	) -> HRESULT,
	CreateImageBrush:                      proc "stdcall" (
		this: ^IDeviceContext,
		image: ^IImage,
		#by_ptr imageBrushProperties: IMAGE_BRUSH_PROPERTIES,
		brushProperties: ^BRUSH_PROPERTIES,
		imageBrush: ^^IImageBrush,
	) -> HRESULT,
	CreateBitmapBrush1:                    proc "stdcall" (
		this: ^IDeviceContext,
		bitmap: ^IBitmap,
		bitmapBrushProperties: ^BITMAP_BRUSH_PROPERTIES1,
		brushProperties: ^BRUSH_PROPERTIES,
		bitmapBrush: ^^IBitmapBrush1,
	) -> HRESULT,
	CreateCommandList:                     proc "stdcall" (this: ^IDeviceContext, commandList: ^^ICommandList) -> HRESULT,
	IsDxgiFormatSupported:                 proc "stdcall" (this: ^IDeviceContext, format: dxgi.FORMAT) -> BOOL,
	IsBufferPrecisionSupported:            proc "stdcall" (this: ^IDeviceContext, bufferPrecision: BUFFER_PRECISION) -> BOOL,
	GetImageLocalBounds:                   proc "stdcall" (this: ^IDeviceContext, image: ^IImage, localBounds: ^RECT_F) -> HRESULT,
	GetImageWorldBounds:                   proc "stdcall" (this: ^IDeviceContext, image: ^IImage, worldBounds: ^RECT_F) -> HRESULT,
	GetGlyphRunWorldBounds:                proc "stdcall" (
		this: ^IDeviceContext,
		baselineOrigin: POINT_2F,
		#by_ptr glyphRun: dwrite.GLYPH_RUN,
		measuringMode: dwrite.MEASURING_MODE,
		bounds: ^RECT_F,
	) -> HRESULT,
	GetDevice:                             proc "stdcall" (this: ^IDeviceContext, device: ^^IDevice),
	SetTarget:                             proc "stdcall" (this: ^IDeviceContext, image: ^IImage),
	GetTarget:                             proc "stdcall" (this: ^IDeviceContext, image: ^^IImage),
	SetRenderingControls:                  proc "stdcall" (this: ^IDeviceContext, #by_ptr renderingControls: RENDERING_CONTROLS),
	GetRenderingControls:                  proc "stdcall" (this: ^IDeviceContext, renderingControls: ^RENDERING_CONTROLS),
	SetPrimitiveBlend:                     proc "stdcall" (this: ^IDeviceContext, primitiveBlend: PRIMITIVE_BLEND),
	GetPrimitiveBlend:                     proc "stdcall" (this: ^IDeviceContext) -> PRIMITIVE_BLEND,
	SetUnitMode:                           proc "stdcall" (this: ^IDeviceContext, unitMode: UNIT_MODE),
	GetUnitMode:                           proc "stdcall" (this: ^IDeviceContext) -> UNIT_MODE,
	DrawGlyphRun_1:                        proc "stdcall" (
		this: ^IDeviceContext,
		baselineOrigin: POINT_2F,
		#by_ptr glyphRun: dwrite.GLYPH_RUN,
		glyphRunDescription: ^dwrite.GLYPH_RUN_DESCRIPTION,
		foregroundBrush: ^IBrush,
		measuringMode: dwrite.MEASURING_MODE,
	),
	DrawImage:                             proc "stdcall" (
		this: ^IDeviceContext,
		image: ^IImage,
		targetOffset: ^POINT_2F,
		imageRectangle: ^RECT_F,
		interpolationMode: INTERPOLATION_MODE,
		compositeMode: d2d_common.COMPOSITE_MODE,
	),
	DrawGdiMetafile:                       proc "stdcall" (this: ^IDeviceContext, gdiMetafile: ^IGdiMetafile, targetOffset: ^POINT_2F),
	DrawBitmap_1:                          proc "stdcall" (
		this: ^IDeviceContext,
		bitmap: ^IBitmap,
		destinationRectangle: ^RECT_F,
		opacity: f32,
		interpolationMode: INTERPOLATION_MODE,
		sourceRectangle: ^RECT_F,
		perspectiveTransform: ^d2d_common.MATRIX_4X4_F,
	),
	PushLayer_1:                           proc "stdcall" (this: ^IDeviceContext, #by_ptr layerParameters: LAYER_PARAMETERS1, layer: ^ILayer),
	InvalidateEffectInputRectangle:        proc "stdcall" (this: ^IDeviceContext, effect: ^IEffect, input: u32, #by_ptr inputRectangle: RECT_F) -> HRESULT,
	GetEffectInvalidRectangleCount:        proc "stdcall" (this: ^IDeviceContext, effect: ^IEffect, rectangleCount: ^u32) -> HRESULT,
	GetEffectInvalidRectangles:            proc "stdcall" (this: ^IDeviceContext, effect: ^IEffect, rectangles: [^]RECT_F, rectanglesCount: u32) -> HRESULT,
	GetEffectRequiredInputRectangles:      proc "stdcall" (
		this: ^IDeviceContext,
		renderEffect: ^IEffect,
		renderImageRectangle: ^RECT_F,
		inputDescriptions: [^]EFFECT_INPUT_DESCRIPTION,
		requiredInputRects: [^]RECT_F,
		inputCount: u32,
	) -> HRESULT,
	FillOpacityMask_1:                     proc "stdcall" (this: ^IDeviceContext, opacityMask: ^IBitmap, brush: ^IBrush, destinationRectangle: ^RECT_F, sourceRectangle: ^RECT_F),
}


IDevice_UUID_STRING := "47dd575d-ac05-4cdd-8049-9b02cd16f44c"
IDevice_UUID := IID{0x47dd575d, 0xac05, 0x4cdd, {0x80, 0x49, 0x9b, 0x02, 0xcd, 0x16, 0xf4, 0x4c}}
IDevice :: struct #raw_union {
	#subtype iresource:   IResource,
	using idevice_vtable: IDevice_VTable,
}
IDevice_VTable :: struct {
	using iresource_vtable:  IResource_VTable,
	CreateDeviceContext:     proc "stdcall" (this: ^IDevice, options: DEVICE_CONTEXT_OPTIONS, deviceContext: ^^IDeviceContext) -> HRESULT,
	CreatePrintControl:      proc "stdcall" (
		this: ^IDevice,
		wicFactory: ^IWICImagingFactory,
		documentTarget: ^IPrintDocumentPackageTarget,
		printControlProperties: ^PRINT_CONTROL_PROPERTIES,
		printControl: ^^IPrintControl,
	) -> HRESULT,
	SetMaximumTextureMemory: proc "stdcall" (this: ^IDevice, maximumInBytes: u64),
	GetMaximumTextureMemory: proc "stdcall" (this: ^IDevice) -> u64,
	ClearResources:          proc "stdcall" (this: ^IDevice, millisecondsSinceUse: u32),
}


IFactory1_UUID_STRING := "bb12d362-daee-4b9a-aa1d-14ba401cfa1f"
IFactory1_UUID := IID{0xbb12d362, 0xdaee, 0x4b9a, {0xaa, 0x1d, 0x14, 0xba, 0x40, 0x1c, 0xfa, 0x1f}}
IFactory1 :: struct #raw_union {
	#subtype ifactory:      IFactory,
	using ifactory1_vtable: IFactory1_VTable,
}
IFactory1_VTable :: struct {
	using ifactory_vtable:    IFactory_VTable,
	CreateDevice1:            proc "stdcall" (this: ^IFactory1, dxgiDevice: ^dxgi.IDevice, d2dDevice: ^^IDevice) -> HRESULT,
	CreateStrokeStyle1:       proc "stdcall" (
		this: ^IFactory1,
		#by_ptr strokeStyleProperties: STROKE_STYLE_PROPERTIES1,
		dashes: [^]f32,
		dashesCount: u32,
		strokeStyle: ^^IStrokeStyle1,
	) -> HRESULT,
	CreatePathGeometry1:      proc "stdcall" (this: ^IFactory1, pathGeometry: ^^IPathGeometry1) -> HRESULT,
	CreateDrawingStateBlock1: proc "stdcall" (
		this: ^IFactory1,
		drawingStateDescription: ^DRAWING_STATE_DESCRIPTION1,
		textRenderingParams: ^dwrite.IRenderingParams,
		drawingStateBlock: ^^IDrawingStateBlock1,
	) -> HRESULT,
	CreateGdiMetafile:        proc "stdcall" (this: ^IFactory1, metafileStream: ^IStream, metafile: ^^IGdiMetafile) -> HRESULT,
	RegisterEffectFromStream: proc "stdcall" (
		this: ^IFactory1,
		#by_ptr classId: IID,
		propertyXml: ^IStream,
		bindings: [^]PROPERTY_BINDING,
		bindingsCount: u32,
		effectFactory: EFFECT_FACTORY,
	) -> HRESULT,
	RegisterEffectFromString: proc "stdcall" (
		this: ^IFactory1,
		#by_ptr classId: IID,
		propertyXml: PWSTR,
		bindings: [^]PROPERTY_BINDING,
		bindingsCount: u32,
		effectFactory: EFFECT_FACTORY,
	) -> HRESULT,
	UnregisterEffect:         proc "stdcall" (this: ^IFactory1, #by_ptr classId: IID) -> HRESULT,
	GetRegisteredEffects:     proc "stdcall" (this: ^IFactory1, effects: [^]IID, effectsCount: u32, effectsReturned: ^u32, effectsRegistered: ^u32) -> HRESULT,
	GetEffectProperties:      proc "stdcall" (this: ^IFactory1, #by_ptr effectId: IID, properties: ^^IProperties) -> HRESULT,
}


IMultithread_UUID_STRING := "31e6e7bc-e0ff-4d46-8c64-a0a8c41c15d3"
IMultithread_UUID := IID{0x31e6e7bc, 0xe0ff, 0x4d46, {0x8c, 0x64, 0xa0, 0xa8, 0xc4, 0x1c, 0x15, 0xd3}}
IMultithread :: struct #raw_union {
	#subtype iunknown:         IUnknown,
	using imultithread_vtable: IMultithread_VTable,
}
IMultithread_VTable :: struct {
	using iunknown_vtable:   IUnknown_VTable,
	GetMultithreadProtected: proc "stdcall" (this: ^IMultithread) -> BOOL,
	Enter:                   proc "stdcall" (this: ^IMultithread),
	Leave:                   proc "stdcall" (this: ^IMultithread),
}

PROPERTY_SET_FUNCTION :: #type proc "stdcall" (effect: ^IUnknown, data: [^]u8, dataSize: u32) -> HRESULT
PROPERTY_GET_FUNCTION :: #type proc "stdcall" (effect: ^IUnknown, data: [^]u8, dataSize: u32, actualSize: ^u32) -> HRESULT

CHANGE_TYPE_Flag :: enum {
	PROPERTIES = 1,
	CONTEXT    = 2,
	GRAPH      = 3,
}
CHANGE_TYPE :: bit_set[CHANGE_TYPE_Flag;u32]

PIXEL_OPTIONS_Flag :: enum {
	TRIVIAL_SAMPLING = 1,
}
PIXEL_OPTIONS :: bit_set[PIXEL_OPTIONS_Flag;u32]

VERTEX_OPTIONS_Flag :: enum {
	DO_NOT_CLEAR      = 1,
	USE_DEPTH_BUFFER  = 2,
	ASSUME_NO_OVERLAP = 4,
}
VERTEX_OPTIONS :: bit_set[VERTEX_OPTIONS_Flag;u32]

VERTEX_USAGE :: enum u32 {
	STATIC,
	DYNAMIC,
}

BLEND_OPERATION :: enum u32 {
	ADD          = 1,
	SUBTRACT     = 2,
	REV_SUBTRACT = 3,
	MIN          = 4,
	MAX          = 5,
}

BLEND :: enum u32 {
	ZERO             = 1,
	ONE              = 2,
	SRC_COLOR        = 3,
	INV_SRC_COLOR    = 4,
	SRC_ALPHA        = 5,
	INV_SRC_ALPHA    = 6,
	DEST_ALPHA       = 7,
	INV_DEST_ALPHA   = 8,
	DEST_COLOR       = 9,
	INV_DEST_COLOR   = 10,
	SRC_ALPHA_SAT    = 11,
	BLEND_FACTOR     = 14,
	INV_BLEND_FACTOR = 15,
}

CHANNEL_DEPTH :: enum u32 {
	_DEFAULT = 0,
	_1       = 1,
	_4       = 4,
}

FILTER :: enum u32 {
	MIN_MAG_MIP_POINT               = 0,
	MIN_MAG_POINT_MIP_LINEAR        = 1,
	MIN_POINT_MAG_LINEAR_MIP_POINT  = 4,
	MIN_POINT_MAG_MIP_LINEAR        = 5,
	MIN_LINEAR_MAG_MIP_POINT        = 16,
	MIN_LINEAR_MAG_POINT_MIP_LINEAR = 17,
	MIN_MAG_LINEAR_MIP_POINT        = 20,
	MIN_MAG_MIP_LINEAR              = 21,
	ANISOTROPIC                     = 85,
}

FEATURE :: enum u32 {
	DOUBLES,
	D3D10_X_HARDWARE_OPTIONS,
}

PROPERTY_BINDING :: struct {
	propertyName: PWSTR,
	setFunction:  PROPERTY_SET_FUNCTION,
	getFunction:  PROPERTY_GET_FUNCTION,
}

RESOURCE_TEXTURE_PROPERTIES :: struct {
	extents:         ^u32,
	dimensions:      u32,
	bufferPrecision: BUFFER_PRECISION,
	channelDepth:    CHANNEL_DEPTH,
	filter:          FILTER,
	extendModes:     ^EXTEND_MODE,
}

INPUT_ELEMENT_DESC :: struct {
	semanticName:      windows.LPSTR,
	semanticIndex:     u32,
	format:            dxgi.FORMAT,
	inputSlot:         u32,
	alignedByteOffset: u32,
}

VERTEX_BUFFER_PROPERTIES :: struct {
	inputCount: u32,
	usage:      VERTEX_USAGE,
	data:       ^u8,
	byteWidth:  u32,
}

CUSTOM_VERTEX_BUFFER_PROPERTIES :: struct {
	shaderBufferWithInputSignature: ^u8,
	shaderBufferSize:               u32,
	inputElements:                  ^INPUT_ELEMENT_DESC,
	elementCount:                   u32,
	stride:                         u32,
}

VERTEX_RANGE :: struct {
	startVertex: u32,
	vertexCount: u32,
}

BLEND_DESCRIPTION :: struct {
	sourceBlend:           BLEND,
	destinationBlend:      BLEND,
	blendOperation:        BLEND_OPERATION,
	sourceBlendAlpha:      BLEND,
	destinationBlendAlpha: BLEND,
	blendOperationAlpha:   BLEND_OPERATION,
	blendFactor:           [4]f32,
}

INPUT_DESCRIPTION :: struct {
	filter:             FILTER,
	levelOfDetailCount: u32,
}

FEATURE_DATA_DOUBLES :: struct {
	doublePrecisionFloatShaderOps: BOOL,
}

FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS :: struct {
	computeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x: BOOL,
}

IVertexBuffer_UUID_STRING := "9b8b1336-00a5-4668-92b7-ced5d8bf9b7b"
IVertexBuffer_UUID := IID{0x9b8b1336, 0x00a5, 0x4668, {0x92, 0xb7, 0xce, 0xd5, 0xd8, 0xbf, 0x9b, 0x7b}}
IVertexBuffer :: struct #raw_union {
	#subtype iunknown:          IUnknown,
	using ivertexbuffer_vtable: IVertexBuffer_VTable,
}
IVertexBuffer_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	Map:                   proc "stdcall" (this: ^IVertexBuffer, data: ^^u8, bufferSize: u32) -> HRESULT,
	Unmap:                 proc "stdcall" (this: ^IVertexBuffer) -> HRESULT,
}


IResourceTexture_UUID_STRING := "688d15c3-02b0-438d-b13a-d1b44c32c39a"
IResourceTexture_UUID := IID{0x688d15c3, 0x02b0, 0x438d, {0xb1, 0x3a, 0xd1, 0xb4, 0x4c, 0x32, 0xc3, 0x9a}}
IResourceTexture :: struct #raw_union {
	#subtype iunknown:             IUnknown,
	using iresourcetexture_vtable: IResourceTexture_VTable,
}
IResourceTexture_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	Update:                proc "stdcall" (
		this: ^IResourceTexture,
		minimumExtents: [^]u32,
		maximimumExtents: [^]u32,
		strides: ^u32,
		dimensions: u32,
		data: [^]u8,
		dataCount: u32,
	) -> HRESULT,
}


IRenderInfo_UUID_STRING := "519ae1bd-d19a-420d-b849-364f594776b7"
IRenderInfo_UUID := IID{0x519ae1bd, 0xd19a, 0x420d, {0xb8, 0x49, 0x36, 0x4f, 0x59, 0x47, 0x76, 0xb7}}
IRenderInfo :: struct #raw_union {
	#subtype iunknown:        IUnknown,
	using irenderinfo_vtable: IRenderInfo_VTable,
}
IRenderInfo_VTable :: struct {
	using iunknown_vtable:   IUnknown_VTable,
	SetInputDescription:     proc "stdcall" (this: ^IRenderInfo, inputIndex: u32, inputDescription: INPUT_DESCRIPTION) -> HRESULT,
	SetOutputBuffer:         proc "stdcall" (this: ^IRenderInfo, bufferPrecision: BUFFER_PRECISION, channelDepth: CHANNEL_DEPTH) -> HRESULT,
	SetCached:               proc "stdcall" (this: ^IRenderInfo, isCached: BOOL),
	SetInstructionCountHint: proc "stdcall" (this: ^IRenderInfo, instructionCount: u32),
}


IDrawInfo_UUID_STRING := "693ce632-7f2f-45de-93fe-18d88b37aa21"
IDrawInfo_UUID := IID{0x693ce632, 0x7f2f, 0x45de, {0x93, 0xfe, 0x18, 0xd8, 0x8b, 0x37, 0xaa, 0x21}}
IDrawInfo :: struct #raw_union {
	#subtype irenderinfo:   IRenderInfo,
	using idrawinfo_vtable: IDrawInfo_VTable,
}
IDrawInfo_VTable :: struct {
	using irenderinfo_vtable:      IRenderInfo_VTable,
	SetPixelShaderConstantBuffer:  proc "stdcall" (this: ^IDrawInfo, buffer: [^]u8, bufferCount: u32) -> HRESULT,
	SetResourceTexture:            proc "stdcall" (this: ^IDrawInfo, textureIndex: u32, resourceTexture: ^IResourceTexture) -> HRESULT,
	SetVertexShaderConstantBuffer: proc "stdcall" (this: ^IDrawInfo, buffer: [^]u8, bufferCount: u32) -> HRESULT,
	SetPixelShader:                proc "stdcall" (this: ^IDrawInfo, #by_ptr shaderId: IID, pixelOptions: PIXEL_OPTIONS) -> HRESULT,
	SetVertexProcessing:           proc "stdcall" (
		this: ^IDrawInfo,
		vertexBuffer: ^IVertexBuffer,
		vertexOptions: VERTEX_OPTIONS,
		blendDescription: ^BLEND_DESCRIPTION,
		vertexRange: ^VERTEX_RANGE,
		vertexShader: ^IID,
	) -> HRESULT,
}


IComputeInfo_UUID_STRING := "5598b14b-9fd7-48b7-9bdb-8f0964eb38bc"
IComputeInfo_UUID := IID{0x5598b14b, 0x9fd7, 0x48b7, {0x9b, 0xdb, 0x8f, 0x09, 0x64, 0xeb, 0x38, 0xbc}}
IComputeInfo :: struct #raw_union {
	#subtype irenderinfo:      IRenderInfo,
	using icomputeinfo_vtable: IComputeInfo_VTable,
}
IComputeInfo_VTable :: struct {
	using irenderinfo_vtable:       IRenderInfo_VTable,
	SetComputeShaderConstantBuffer: proc "stdcall" (this: ^IComputeInfo, buffer: [^]u8, bufferCount: u32) -> HRESULT,
	SetComputeShader:               proc "stdcall" (this: ^IComputeInfo, #by_ptr shaderId: IID) -> HRESULT,
	SetResourceTexture:             proc "stdcall" (this: ^IComputeInfo, textureIndex: u32, resourceTexture: ^IResourceTexture) -> HRESULT,
}


ITransformNode_UUID_STRING := "b2efe1e7-729f-4102-949f-505fa21bf666"
ITransformNode_UUID := IID{0xb2efe1e7, 0x729f, 0x4102, {0x94, 0x9f, 0x50, 0x5f, 0xa2, 0x1b, 0xf6, 0x66}}
ITransformNode :: struct #raw_union {
	#subtype iunknown:           IUnknown,
	using itransformnode_vtable: ITransformNode_VTable,
}
ITransformNode_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetInputCount:         proc "stdcall" (this: ^ITransformNode) -> u32,
}


ITransformGraph_UUID_STRING := "13d29038-c3e6-4034-9081-13b53a417992"
ITransformGraph_UUID := IID{0x13d29038, 0xc3e6, 0x4034, {0x90, 0x81, 0x13, 0xb5, 0x3a, 0x41, 0x79, 0x92}}
ITransformGraph :: struct #raw_union {
	#subtype iunknown:            IUnknown,
	using itransformgraph_vtable: ITransformGraph_VTable,
}
ITransformGraph_VTable :: struct {
	using iunknown_vtable:  IUnknown_VTable,
	GetInputCount:          proc "stdcall" (this: ^ITransformGraph) -> u32,
	SetSingleTransformNode: proc "stdcall" (this: ^ITransformGraph, node: ^ITransformNode) -> HRESULT,
	AddNode:                proc "stdcall" (this: ^ITransformGraph, node: ^ITransformNode) -> HRESULT,
	RemoveNode:             proc "stdcall" (this: ^ITransformGraph, node: ^ITransformNode) -> HRESULT,
	SetOutputNode:          proc "stdcall" (this: ^ITransformGraph, node: ^ITransformNode) -> HRESULT,
	ConnectNode:            proc "stdcall" (this: ^ITransformGraph, fromNode: ^ITransformNode, toNode: ^ITransformNode, toNodeInputIndex: u32) -> HRESULT,
	ConnectToEffectInput:   proc "stdcall" (this: ^ITransformGraph, toEffectInputIndex: u32, node: ^ITransformNode, toNodeInputIndex: u32) -> HRESULT,
	Clear:                  proc "stdcall" (this: ^ITransformGraph),
	SetPassthroughGraph:    proc "stdcall" (this: ^ITransformGraph, effectInputIndex: u32) -> HRESULT,
}


ITransform_UUID_STRING := "ef1a287d-342a-4f76-8fdb-da0d6ea9f92b"
ITransform_UUID := IID{0xef1a287d, 0x342a, 0x4f76, {0x8f, 0xdb, 0xda, 0x0d, 0x6e, 0xa9, 0xf9, 0x2b}}
ITransform :: struct #raw_union {
	#subtype itransformnode: ITransformNode,
	using itransform_vtable: ITransform_VTable,
}
ITransform_VTable :: struct {
	using itransformnode_vtable: ITransformNode_VTable,
	MapOutputRectToInputRects:   proc "stdcall" (this: ^ITransform, #by_ptr outputRect: RECT, inputRects: [^]RECT, inputRectsCount: u32) -> HRESULT,
	MapInputRectsToOutputRect:   proc "stdcall" (
		this: ^ITransform,
		inputRects: [^]RECT,
		inputOpaqueSubRects: [^]RECT,
		inputRectCount: u32,
		outputRect: ^RECT,
		outputOpaqueSubRect: ^RECT,
	) -> HRESULT,
	MapInvalidRect:              proc "stdcall" (this: ^ITransform, inputIndex: u32, invalidInputRect: RECT, invalidOutputRect: ^RECT) -> HRESULT,
}


IDrawTransform_UUID_STRING := "36bfdcb6-9739-435d-a30d-a653beff6a6f"
IDrawTransform_UUID := IID{0x36bfdcb6, 0x9739, 0x435d, {0xa3, 0x0d, 0xa6, 0x53, 0xbe, 0xff, 0x6a, 0x6f}}
IDrawTransform :: struct #raw_union {
	#subtype itransform:         ITransform,
	using idrawtransform_vtable: IDrawTransform_VTable,
}
IDrawTransform_VTable :: struct {
	using itransform_vtable: ITransform_VTable,
	SetDrawInfo:             proc "stdcall" (this: ^IDrawTransform, drawInfo: ^IDrawInfo) -> HRESULT,
}


IComputeTransform_UUID_STRING := "0d85573c-01e3-4f7d-bfd9-0d60608bf3c3"
IComputeTransform_UUID := IID{0x0d85573c, 0x01e3, 0x4f7d, {0xbf, 0xd9, 0x0d, 0x60, 0x60, 0x8b, 0xf3, 0xc3}}
IComputeTransform :: struct #raw_union {
	#subtype itransform:            ITransform,
	using icomputetransform_vtable: IComputeTransform_VTable,
}
IComputeTransform_VTable :: struct {
	using itransform_vtable: ITransform_VTable,
	SetComputeInfo:          proc "stdcall" (this: ^IComputeTransform, computeInfo: ^IComputeInfo) -> HRESULT,
	CalculateThreadgroups:   proc "stdcall" (this: ^IComputeTransform, #by_ptr outputRect: RECT, dimensionX: ^u32, dimensionY: ^u32, dimensionZ: ^u32) -> HRESULT,
}


IAnalysisTransform_UUID_STRING := "0359dc30-95e6-4568-9055-27720d130e93"
IAnalysisTransform_UUID := IID{0x0359dc30, 0x95e6, 0x4568, {0x90, 0x55, 0x27, 0x72, 0x0d, 0x13, 0x0e, 0x93}}
IAnalysisTransform :: struct #raw_union {
	#subtype iunknown:               IUnknown,
	using ianalysistransform_vtable: IAnalysisTransform_VTable,
}
IAnalysisTransform_VTable :: struct {
	using iunknown_vtable:  IUnknown_VTable,
	ProcessAnalysisResults: proc "stdcall" (this: ^IAnalysisTransform, analysisData: [^]u8, analysisDataCount: u32) -> HRESULT,
}


ISourceTransform_UUID_STRING := "db1800dd-0c34-4cf9-be90-31cc0a5653e1"
ISourceTransform_UUID := IID{0xdb1800dd, 0x0c34, 0x4cf9, {0xbe, 0x90, 0x31, 0xcc, 0x0a, 0x56, 0x53, 0xe1}}
ISourceTransform :: struct #raw_union {
	#subtype itransform:           ITransform,
	using isourcetransform_vtable: ISourceTransform_VTable,
}
ISourceTransform_VTable :: struct {
	using itransform_vtable: ITransform_VTable,
	SetRenderInfo:           proc "stdcall" (this: ^ISourceTransform, renderInfo: ^IRenderInfo) -> HRESULT,
	Draw:                    proc "stdcall" (this: ^ISourceTransform, target: ^IBitmap1, #by_ptr drawRect: RECT, targetOrigin: d2d_common.POINT_2U) -> HRESULT,
}


IConcreteTransform_UUID_STRING := "1a799d8a-69f7-4e4c-9fed-437ccc6684cc"
IConcreteTransform_UUID := IID{0x1a799d8a, 0x69f7, 0x4e4c, {0x9f, 0xed, 0x43, 0x7c, 0xcc, 0x66, 0x84, 0xcc}}
IConcreteTransform :: struct #raw_union {
	#subtype itransformnode:         ITransformNode,
	using iconcretetransform_vtable: IConcreteTransform_VTable,
}
IConcreteTransform_VTable :: struct {
	using itransformnode_vtable: ITransformNode_VTable,
	SetOutputBuffer:             proc "stdcall" (this: ^IConcreteTransform, bufferPrecision: BUFFER_PRECISION, channelDepth: CHANNEL_DEPTH) -> HRESULT,
	SetCached:                   proc "stdcall" (this: ^IConcreteTransform, isCached: BOOL),
}


IBlendTransform_UUID_STRING := "63ac0b32-ba44-450f-8806-7f4ca1ff2f1b"
IBlendTransform_UUID := IID{0x63ac0b32, 0xba44, 0x450f, {0x88, 0x06, 0x7f, 0x4c, 0xa1, 0xff, 0x2f, 0x1b}}
IBlendTransform :: struct #raw_union {
	#subtype iconcretetransform:  IConcreteTransform,
	using iblendtransform_vtable: IBlendTransform_VTable,
}
IBlendTransform_VTable :: struct {
	using iconcretetransform_vtable: IConcreteTransform_VTable,
	SetDescription:                  proc "stdcall" (this: ^IBlendTransform, #by_ptr description: BLEND_DESCRIPTION),
	GetDescription:                  proc "stdcall" (this: ^IBlendTransform, description: ^BLEND_DESCRIPTION),
}


IBorderTransform_UUID_STRING := "4998735c-3a19-473c-9781-656847e3a347"
IBorderTransform_UUID := IID{0x4998735c, 0x3a19, 0x473c, {0x97, 0x81, 0x65, 0x68, 0x47, 0xe3, 0xa3, 0x47}}
IBorderTransform :: struct #raw_union {
	#subtype iconcretetransform:   IConcreteTransform,
	using ibordertransform_vtable: IBorderTransform_VTable,
}
IBorderTransform_VTable :: struct {
	using iconcretetransform_vtable: IConcreteTransform_VTable,
	SetExtendModeX:                  proc "stdcall" (this: ^IBorderTransform, extendMode: EXTEND_MODE),
	SetExtendModeY:                  proc "stdcall" (this: ^IBorderTransform, extendMode: EXTEND_MODE),
	GetExtendModeX:                  proc "stdcall" (this: ^IBorderTransform) -> EXTEND_MODE,
	GetExtendModeY:                  proc "stdcall" (this: ^IBorderTransform) -> EXTEND_MODE,
}


IOffsetTransform_UUID_STRING := "3fe6adea-7643-4f53-bd14-a0ce63f24042"
IOffsetTransform_UUID := IID{0x3fe6adea, 0x7643, 0x4f53, {0xbd, 0x14, 0xa0, 0xce, 0x63, 0xf2, 0x40, 0x42}}
IOffsetTransform :: struct #raw_union {
	#subtype itransformnode:       ITransformNode,
	using ioffsettransform_vtable: IOffsetTransform_VTable,
}
IOffsetTransform_VTable :: struct {
	using itransformnode_vtable: ITransformNode_VTable,
	SetOffset:                   proc "stdcall" (this: ^IOffsetTransform, offset: POINT),
	GetOffset:                   proc "stdcall" (this: ^IOffsetTransform) -> POINT,
}


IBoundsAdjustmentTransform_UUID_STRING := "90f732e2-5092-4606-a819-8651970baccd"
IBoundsAdjustmentTransform_UUID := IID{0x90f732e2, 0x5092, 0x4606, {0xa8, 0x19, 0x86, 0x51, 0x97, 0x0b, 0xac, 0xcd}}
IBoundsAdjustmentTransform :: struct #raw_union {
	#subtype itransformnode:                 ITransformNode,
	using iboundsadjustmenttransform_vtable: IBoundsAdjustmentTransform_VTable,
}
IBoundsAdjustmentTransform_VTable :: struct {
	using itransformnode_vtable: ITransformNode_VTable,
	SetOutputBounds:             proc "stdcall" (this: ^IBoundsAdjustmentTransform, #by_ptr outputBounds: RECT),
	GetOutputBounds:             proc "stdcall" (this: ^IBoundsAdjustmentTransform, outputBounds: ^RECT),
}


IEffectImpl_UUID_STRING := "a248fd3f-3e6c-4e63-9f03-7f68ecc91db9"
IEffectImpl_UUID := IID{0xa248fd3f, 0x3e6c, 0x4e63, {0x9f, 0x03, 0x7f, 0x68, 0xec, 0xc9, 0x1d, 0xb9}}
IEffectImpl :: struct #raw_union {
	#subtype iunknown:        IUnknown,
	using ieffectimpl_vtable: IEffectImpl_VTable,
}
IEffectImpl_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	Initialize:            proc "stdcall" (this: ^IEffectImpl, effectContext: ^IEffectContext, transformGraph: ^ITransformGraph) -> HRESULT,
	PrepareForRender:      proc "stdcall" (this: ^IEffectImpl, changeType: CHANGE_TYPE) -> HRESULT,
	SetGraph:              proc "stdcall" (this: ^IEffectImpl, transformGraph: ^ITransformGraph) -> HRESULT,
}


IEffectContext_UUID_STRING := "3d9f916b-27dc-4ad7-b4f1-64945340f563"
IEffectContext_UUID := IID{0x3d9f916b, 0x27dc, 0x4ad7, {0xb4, 0xf1, 0x64, 0x94, 0x53, 0x40, 0xf5, 0x63}}
IEffectContext :: struct #raw_union {
	#subtype iunknown:           IUnknown,
	using ieffectcontext_vtable: IEffectContext_VTable,
}
IEffectContext_VTable :: struct {
	using iunknown_vtable:                 IUnknown_VTable,
	GetDpi:                                proc "stdcall" (this: ^IEffectContext, dpiX: ^f32, dpiY: ^f32),
	CreateEffect:                          proc "stdcall" (this: ^IEffectContext, #by_ptr effectId: IID, effect: ^^IEffect) -> HRESULT,
	GetMaximumSupportedFeatureLevel:       proc "stdcall" (
		this: ^IEffectContext,
		featureLevels: [^]d3d.FEATURE_LEVEL,
		featureLevelsCount: u32,
		maximumSupportedFeatureLevel: ^d3d.FEATURE_LEVEL,
	) -> HRESULT,
	CreateTransformNodeFromEffect:         proc "stdcall" (this: ^IEffectContext, effect: ^IEffect, transformNode: ^^ITransformNode) -> HRESULT,
	CreateBlendTransform:                  proc "stdcall" (
		this: ^IEffectContext,
		numInputs: u32,
		#by_ptr blendDescription: BLEND_DESCRIPTION,
		transform: ^^IBlendTransform,
	) -> HRESULT,
	CreateBorderTransform:                 proc "stdcall" (this: ^IEffectContext, extendModeX: EXTEND_MODE, extendModeY: EXTEND_MODE, transform: ^^IBorderTransform) -> HRESULT,
	CreateOffsetTransform:                 proc "stdcall" (this: ^IEffectContext, offset: POINT, transform: ^^IOffsetTransform) -> HRESULT,
	CreateBoundsAdjustmentTransform:       proc "stdcall" (this: ^IEffectContext, #by_ptr outputRectangle: RECT, transform: ^^IBoundsAdjustmentTransform) -> HRESULT,
	LoadPixelShader:                       proc "stdcall" (this: ^IEffectContext, #by_ptr shaderId: IID, shaderBuffer: [^]u8, shaderBufferCount: u32) -> HRESULT,
	LoadVertexShader:                      proc "stdcall" (this: ^IEffectContext, #by_ptr resourceId: IID, shaderBuffer: [^]u8, shaderBufferCount: u32) -> HRESULT,
	LoadComputeShader:                     proc "stdcall" (this: ^IEffectContext, #by_ptr resourceId: IID, shaderBuffer: [^]u8, shaderBufferCount: u32) -> HRESULT,
	IsShaderLoaded:                        proc "stdcall" (this: ^IEffectContext, #by_ptr shaderId: IID) -> BOOL,
	CreateResourceTexture:                 proc "stdcall" (
		this: ^IEffectContext,
		resourceId: ^IID,
		#by_ptr resourceTextureProperties: RESOURCE_TEXTURE_PROPERTIES,
		data: [^]u8,
		strides: ^u32,
		dataSize: u32,
		resourceTexture: ^^IResourceTexture,
	) -> HRESULT,
	FindResourceTexture:                   proc "stdcall" (this: ^IEffectContext, #by_ptr resourceId: IID, resourceTexture: ^^IResourceTexture) -> HRESULT,
	CreateVertexBuffer:                    proc "stdcall" (
		this: ^IEffectContext,
		#by_ptr vertexBufferProperties: VERTEX_BUFFER_PROPERTIES,
		resourceId: ^IID,
		customVertexBufferProperties: ^CUSTOM_VERTEX_BUFFER_PROPERTIES,
		buffer: ^^IVertexBuffer,
	) -> HRESULT,
	FindVertexBuffer:                      proc "stdcall" (this: ^IEffectContext, #by_ptr resourceId: IID, buffer: ^^IVertexBuffer) -> HRESULT,
	CreateColorContext:                    proc "stdcall" (this: ^IEffectContext, space: COLOR_SPACE, profile: [^]u8, profileSize: u32, colorContext: ^^IColorContext) -> HRESULT,
	CreateColorContextFromFilename:        proc "stdcall" (this: ^IEffectContext, filename: PWSTR, colorContext: ^^IColorContext) -> HRESULT,
	CreateColorContextFromWicColorContext: proc "stdcall" (this: ^IEffectContext, wicColorContext: ^IWICColorContext, colorContext: ^^IColorContext) -> HRESULT,
	CheckFeatureSupport:                   proc "stdcall" (this: ^IEffectContext, feature: FEATURE, featureSupportData: rawptr, featureSupportDataSize: u32) -> HRESULT,
	IsBufferPrecisionSupported:            proc "stdcall" (this: ^IEffectContext, bufferPrecision: BUFFER_PRECISION) -> BOOL,
}


YCBCR_PROP :: enum u32 {
	CHROMA_SUBSAMPLING,
	TRANSFORM_MATRIX,
	INTERPOLATION_MODE,
}

YCBCR_CHROMA_SUBSAMPLING :: enum u32 {
	_AUTO,
	_420,
	_422,
	_444,
	_440,
}

YCBCR_INTERPOLATION_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
	HIGH_QUALITY_CUBIC,
}

CONTRAST_PROP :: enum u32 {
	CONTRAST,
	CLAMP_INPUT,
}

RGBTOHUE_PROP :: enum u32 {
	OUTPUT_COLOR_SPACE,
}

RGBTOHUE_OUTPUT_COLOR_SPACE :: enum u32 {
	HUE_SATURATION_VALUE,
	HUE_SATURATION_LIGHTNESS,
}

HUETORGB_PROP :: enum u32 {
	INPUT_COLOR_SPACE,
}

HUETORGB_INPUT_COLOR_SPACE :: enum u32 {
	HUE_SATURATION_VALUE,
	HUE_SATURATION_LIGHTNESS,
}

CHROMAKEY_PROP :: enum u32 {
	COLOR,
	TOLERANCE,
	INVERT_ALPHA,
	FEATHER,
}

EMBOSS_PROP :: enum u32 {
	HEIGHT,
	DIRECTION,
}

EXPOSURE_PROP :: enum u32 {
	EXPOSURE_VALUE,
}

POSTERIZE_PROP :: enum u32 {
	RED_VALUE_COUNT,
	GREEN_VALUE_COUNT,
	BLUE_VALUE_COUNT,
}

SEPIA_PROP :: enum u32 {
	INTENSITY,
	ALPHA_MODE,
}

SHARPEN_PROP :: enum u32 {
	SHARPNESS,
	THRESHOLD,
}

STRAIGHTEN_PROP :: enum u32 {
	ANGLE,
	MAINTAIN_SIZE,
	SCALE_MODE,
}

STRAIGHTEN_SCALE_MODE :: enum u32 {
	NEAREST_NEIGHBOR,
	LINEAR,
	CUBIC,
	MULTI_SAMPLE_LINEAR,
	ANISOTROPIC,
}

TEMPERATUREANDTINT_PROP :: enum u32 {
	TEMPERATURE,
	TINT,
}

VIGNETTE_PROP :: enum u32 {
	COLOR,
	TRANSITION_SIZE,
	STRENGTH,
}

EDGEDETECTION_PROP :: enum u32 {
	STRENGTH,
	BLUR_RADIUS,
	MODE,
	OVERLAY_EDGES,
	ALPHA_MODE,
}

EDGEDETECTION_MODE :: enum u32 {
	SOBEL,
	PREWITT,
}

HIGHLIGHTSANDSHADOWS_PROP :: enum u32 {
	HIGHLIGHTS,
	SHADOWS,
	CLARITY,
	INPUT_GAMMA,
	MASK_BLUR_RADIUS,
}

HIGHLIGHTSANDSHADOWS_INPUT_GAMMA :: enum u32 {
	LINEAR,
	SRGB,
}

LOOKUPTABLE3D_PROP :: enum u32 {
	LUT,
	ALPHA_MODE,
}

OPACITY_PROP :: enum u32 {
	OPACITY,
}

CROSSFADE_PROP :: enum u32 {
	WEIGHT,
}

TINT_PROP :: enum u32 {
	COLOR,
	CLAMP_OUTPUT,
}

WHITELEVELADJUSTMENT_PROP :: enum u32 {
	INPUT_WHITE_LEVEL,
	OUTPUT_WHITE_LEVEL,
}

HDRTONEMAP_PROP :: enum u32 {
	INPUT_MAX_LUMINANCE,
	OUTPUT_MAX_LUMINANCE,
	DISPLAY_MODE,
}

HDRTONEMAP_DISPLAY_MODE :: enum u32 {
	SDR,
	HDR,
}

RENDERING_PRIORITY :: enum u32 {
	NORMAL,
	LOW,
}

IGeometryRealization_UUID_STRING := "a16907d7-bc02-4801-99e8-8cf7f485f774"
IGeometryRealization_UUID := IID{0xa16907d7, 0xbc02, 0x4801, {0x99, 0xe8, 0x8c, 0xf7, 0xf4, 0x85, 0xf7, 0x74}}
IGeometryRealization :: struct #raw_union {
	#subtype iresource:                IResource,
	using igeometryrealization_vtable: IGeometryRealization_VTable,
}
IGeometryRealization_VTable :: struct {
	using iresource_vtable: IResource_VTable,
}


IDeviceContext1_UUID_STRING := "d37f57e4-6908-459f-a199-e72f24f79987"
IDeviceContext1_UUID := IID{0xd37f57e4, 0x6908, 0x459f, {0xa1, 0x99, 0xe7, 0x2f, 0x24, 0xf7, 0x99, 0x87}}
IDeviceContext1 :: struct #raw_union {
	#subtype idevicecontext:      IDeviceContext,
	using idevicecontext1_vtable: IDeviceContext1_VTable,
}
IDeviceContext1_VTable :: struct {
	using idevicecontext_vtable:      IDeviceContext_VTable,
	CreateFilledGeometryRealization:  proc "stdcall" (
		this: ^IDeviceContext1,
		geometry: ^IGeometry,
		flatteningTolerance: f32,
		geometryRealization: ^^IGeometryRealization,
	) -> HRESULT,
	CreateStrokedGeometryRealization: proc "stdcall" (
		this: ^IDeviceContext1,
		geometry: ^IGeometry,
		flatteningTolerance: f32,
		strokeWidth: f32,
		strokeStyle: ^IStrokeStyle,
		geometryRealization: ^^IGeometryRealization,
	) -> HRESULT,
	DrawGeometryRealization:          proc "stdcall" (this: ^IDeviceContext1, geometryRealization: ^IGeometryRealization, brush: ^IBrush),
}


IDevice1_UUID_STRING := "d21768e1-23a4-4823-a14b-7c3eba85d658"
IDevice1_UUID := IID{0xd21768e1, 0x23a4, 0x4823, {0xa1, 0x4b, 0x7c, 0x3e, 0xba, 0x85, 0xd6, 0x58}}
IDevice1 :: struct #raw_union {
	#subtype idevice:      IDevice,
	using idevice1_vtable: IDevice1_VTable,
}
IDevice1_VTable :: struct {
	using idevice_vtable: IDevice_VTable,
	GetRenderingPriority: proc "stdcall" (this: ^IDevice1) -> RENDERING_PRIORITY,
	SetRenderingPriority: proc "stdcall" (this: ^IDevice1, renderingPriority: RENDERING_PRIORITY),
	CreateDeviceContext1: proc "stdcall" (this: ^IDevice1, options: DEVICE_CONTEXT_OPTIONS, deviceContext1: ^^IDeviceContext1) -> HRESULT,
}


IFactory2_UUID_STRING := "94f81a73-9212-4376-9c58-b16a3a0d3992"
IFactory2_UUID := IID{0x94f81a73, 0x9212, 0x4376, {0x9c, 0x58, 0xb1, 0x6a, 0x3a, 0x0d, 0x39, 0x92}}
IFactory2 :: struct #raw_union {
	#subtype ifactory1:     IFactory1,
	using ifactory2_vtable: IFactory2_VTable,
}
IFactory2_VTable :: struct {
	using ifactory1_vtable: IFactory1_VTable,
	CreateDevice:           proc "stdcall" (this: ^IFactory2, dxgiDevice: ^dxgi.IDevice, d2dDevice1: ^^IDevice1) -> HRESULT,
}


ICommandSink1_UUID_STRING := "9eb767fd-4269-4467-b8c2-eb30cb305743"
ICommandSink1_UUID := IID{0x9eb767fd, 0x4269, 0x4467, {0xb8, 0xc2, 0xeb, 0x30, 0xcb, 0x30, 0x57, 0x43}}
ICommandSink1 :: struct #raw_union {
	#subtype icommandsink:      ICommandSink,
	using icommandsink1_vtable: ICommandSink1_VTable,
}
ICommandSink1_VTable :: struct {
	using icommandsink_vtable: ICommandSink_VTable,
	SetPrimitiveBlend1:        proc "stdcall" (this: ^ICommandSink1, primitiveBlend: PRIMITIVE_BLEND) -> HRESULT,
}


SVG_PAINT_TYPE :: enum u32 {
	NONE,
	COLOR,
	CURRENT_COLOR,
	URI,
	URI_NONE,
	URI_COLOR,
	URI_CURRENT_COLOR,
}

SVG_LENGTH_UNITS :: enum u32 {
	NUMBER,
	PERCENTAGE,
}

SVG_DISPLAY :: enum u32 {
	INLINE,
	NONE,
}

SVG_VISIBILITY :: enum u32 {
	VISIBLE,
	HIDDEN,
}

SVG_OVERFLOW :: enum u32 {
	VISIBLE,
	HIDDEN,
}

SVG_LINE_CAP :: enum u32 {
	BUTT,
	SQUARE,
	ROUND,
}

SVG_LINE_JOIN :: enum u32 {
	BEVEL = 1,
	MITER = 3,
	ROUND = 2,
}

SVG_ASPECT_ALIGN :: enum u32 {
	NONE,
	X_MIN_Y_MIN,
	X_MID_Y_MIN,
	X_MAX_Y_MIN,
	X_MIN_Y_MID,
	X_MID_Y_MID,
	X_MAX_Y_MID,
	X_MIN_Y_MAX,
	X_MID_Y_MAX,
	X_MAX_Y_MAX,
}

SVG_ASPECT_SCALING :: enum u32 {
	MEET,
	SLICE,
}

SVG_PATH_COMMAND :: enum u32 {
	CLOSE_PATH,
	MOVE_ABSOLUTE,
	MOVE_RELATIVE,
	LINE_ABSOLUTE,
	LINE_RELATIVE,
	CUBIC_ABSOLUTE,
	CUBIC_RELATIVE,
	QUADRADIC_ABSOLUTE,
	QUADRADIC_RELATIVE,
	ARC_ABSOLUTE,
	ARC_RELATIVE,
	HORIZONTAL_ABSOLUTE,
	HORIZONTAL_RELATIVE,
	VERTICAL_ABSOLUTE,
	VERTICAL_RELATIVE,
	CUBIC_SMOOTH_ABSOLUTE,
	CUBIC_SMOOTH_RELATIVE,
	QUADRADIC_SMOOTH_ABSOLUTE,
	QUADRADIC_SMOOTH_RELATIVE,
}

SVG_UNIT_TYPE :: enum u32 {
	USER_SPACE_ON_USE,
	OBJECT_BOUNDING_BOX,
}

SVG_ATTRIBUTE_STRING_TYPE :: enum u32 {
	SVG,
	ID,
}

SVG_ATTRIBUTE_POD_TYPE :: enum u32 {
	FLOAT,
	COLOR,
	FILL_MODE,
	DISPLAY,
	OVERFLOW,
	LINE_CAP,
	LINE_JOIN,
	VISIBILITY,
	MATRIX,
	UNIT_TYPE,
	EXTEND_MODE,
	PRESERVE_ASPECT_RATIO,
	VIEWBOX,
	LENGTH,
}

SVG_LENGTH :: struct {
	value: f32,
	units: SVG_LENGTH_UNITS,
}

SVG_PRESERVE_ASPECT_RATIO :: struct {
	defer_:      BOOL,
	align:       SVG_ASPECT_ALIGN,
	meetOrSlice: SVG_ASPECT_SCALING,
}

SVG_VIEWBOX :: struct {
	x:      f32,
	y:      f32,
	width:  f32,
	height: f32,
}

ISvgAttribute_UUID_STRING := "c9cdb0dd-f8c9-4e70-b7c2-301c80292c5e"
ISvgAttribute_UUID := IID{0xc9cdb0dd, 0xf8c9, 0x4e70, {0xb7, 0xc2, 0x30, 0x1c, 0x80, 0x29, 0x2c, 0x5e}}
ISvgAttribute :: struct #raw_union {
	#subtype iresource:         IResource,
	using isvgattribute_vtable: ISvgAttribute_VTable,
}
ISvgAttribute_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	GetElement:             proc "stdcall" (this: ^ISvgAttribute, element: ^^ISvgElement),
	Clone:                  proc "stdcall" (this: ^ISvgAttribute, attribute: ^^ISvgAttribute) -> HRESULT,
}


ISvgPaint_UUID_STRING := "d59bab0a-68a2-455b-a5dc-9eb2854e2490"
ISvgPaint_UUID := IID{0xd59bab0a, 0x68a2, 0x455b, {0xa5, 0xdc, 0x9e, 0xb2, 0x85, 0x4e, 0x24, 0x90}}
ISvgPaint :: struct #raw_union {
	#subtype isvgattribute: ISvgAttribute,
	using isvgpaint_vtable: ISvgPaint_VTable,
}
ISvgPaint_VTable :: struct {
	using isvgattribute_vtable: ISvgAttribute_VTable,
	SetPaintType:               proc "stdcall" (this: ^ISvgPaint, paintType: SVG_PAINT_TYPE) -> HRESULT,
	GetPaintType:               proc "stdcall" (this: ^ISvgPaint) -> SVG_PAINT_TYPE,
	SetColor:                   proc "stdcall" (this: ^ISvgPaint, #by_ptr color: COLOR_F) -> HRESULT,
	GetColor:                   proc "stdcall" (this: ^ISvgPaint, color: ^COLOR_F),
	SetId:                      proc "stdcall" (this: ^ISvgPaint, id: PWSTR) -> HRESULT,
	GetId:                      proc "stdcall" (this: ^ISvgPaint, id: [^]u8, idCount: u32) -> HRESULT,
	GetIdLength:                proc "stdcall" (this: ^ISvgPaint) -> u32,
}


ISvgStrokeDashArray_UUID_STRING := "f1c0ca52-92a3-4f00-b4ce-f35691efd9d9"
ISvgStrokeDashArray_UUID := IID{0xf1c0ca52, 0x92a3, 0x4f00, {0xb4, 0xce, 0xf3, 0x56, 0x91, 0xef, 0xd9, 0xd9}}
ISvgStrokeDashArray :: struct #raw_union {
	#subtype isvgattribute:           ISvgAttribute,
	using isvgstrokedasharray_vtable: ISvgStrokeDashArray_VTable,
}
ISvgStrokeDashArray_VTable :: struct {
	using isvgattribute_vtable: ISvgAttribute_VTable,
	RemoveDashesAtEnd:          proc "stdcall" (this: ^ISvgStrokeDashArray, dashesCount: u32) -> HRESULT,
	UpdateDashes:               proc "stdcall" (this: ^ISvgStrokeDashArray, dashes: [^]SVG_LENGTH, dashesCount: u32, startIndex: u32) -> HRESULT,
	UpdateDashes_1:             proc "stdcall" (this: ^ISvgStrokeDashArray, dashes: [^]f32, dashesCount: u32, startIndex: u32) -> HRESULT,
	GetDashes:                  proc "stdcall" (this: ^ISvgStrokeDashArray, dashes: [^]SVG_LENGTH, dashesCount: u32, startIndex: u32) -> HRESULT,
	GetDashes_1:                proc "stdcall" (this: ^ISvgStrokeDashArray, dashes: [^]f32, dashesCount: u32, startIndex: u32) -> HRESULT,
	GetDashesCount:             proc "stdcall" (this: ^ISvgStrokeDashArray) -> u32,
}


ISvgPointCollection_UUID_STRING := "9dbe4c0d-3572-4dd9-9825-5530813bb712"
ISvgPointCollection_UUID := IID{0x9dbe4c0d, 0x3572, 0x4dd9, {0x98, 0x25, 0x55, 0x30, 0x81, 0x3b, 0xb7, 0x12}}
ISvgPointCollection :: struct #raw_union {
	#subtype isvgattribute:           ISvgAttribute,
	using isvgpointcollection_vtable: ISvgPointCollection_VTable,
}
ISvgPointCollection_VTable :: struct {
	using isvgattribute_vtable: ISvgAttribute_VTable,
	RemovePointsAtEnd:          proc "stdcall" (this: ^ISvgPointCollection, pointsCount: u32) -> HRESULT,
	UpdatePoints:               proc "stdcall" (this: ^ISvgPointCollection, points: [^]POINT_2F, pointsCount: u32, startIndex: u32) -> HRESULT,
	GetPoints:                  proc "stdcall" (this: ^ISvgPointCollection, points: [^]POINT_2F, pointsCount: u32, startIndex: u32) -> HRESULT,
	GetPointsCount:             proc "stdcall" (this: ^ISvgPointCollection) -> u32,
}


ISvgPathData_UUID_STRING := "c095e4f4-bb98-43d6-9745-4d1b84ec9888"
ISvgPathData_UUID := IID{0xc095e4f4, 0xbb98, 0x43d6, {0x97, 0x45, 0x4d, 0x1b, 0x84, 0xec, 0x98, 0x88}}
ISvgPathData :: struct #raw_union {
	#subtype isvgattribute:    ISvgAttribute,
	using isvgpathdata_vtable: ISvgPathData_VTable,
}
ISvgPathData_VTable :: struct {
	using isvgattribute_vtable: ISvgAttribute_VTable,
	RemoveSegmentDataAtEnd:     proc "stdcall" (this: ^ISvgPathData, dataCount: u32) -> HRESULT,
	UpdateSegmentData:          proc "stdcall" (this: ^ISvgPathData, data: [^]f32, dataCount: u32, startIndex: u32) -> HRESULT,
	GetSegmentData:             proc "stdcall" (this: ^ISvgPathData, data: [^]f32, dataCount: u32, startIndex: u32) -> HRESULT,
	GetSegmentDataCount:        proc "stdcall" (this: ^ISvgPathData) -> u32,
	RemoveCommandsAtEnd:        proc "stdcall" (this: ^ISvgPathData, commandsCount: u32) -> HRESULT,
	UpdateCommands:             proc "stdcall" (this: ^ISvgPathData, commands: [^]SVG_PATH_COMMAND, commandsCount: u32, startIndex: u32) -> HRESULT,
	GetCommands:                proc "stdcall" (this: ^ISvgPathData, commands: [^]SVG_PATH_COMMAND, commandsCount: u32, startIndex: u32) -> HRESULT,
	GetCommandsCount:           proc "stdcall" (this: ^ISvgPathData) -> u32,
	CreatePathGeometry:         proc "stdcall" (this: ^ISvgPathData, fillMode: FILL_MODE, pathGeometry: ^^IPathGeometry1) -> HRESULT,
}


ISvgElement_UUID_STRING := "ac7b67a6-183e-49c1-a823-0ebe40b0db29"
ISvgElement_UUID := IID{0xac7b67a6, 0x183e, 0x49c1, {0xa8, 0x23, 0x0e, 0xbe, 0x40, 0xb0, 0xdb, 0x29}}
ISvgElement :: struct #raw_union {
	#subtype iresource:       IResource,
	using isvgelement_vtable: ISvgElement_VTable,
}
ISvgElement_VTable :: struct {
	using iresource_vtable:          IResource_VTable,
	GetDocument:                     proc "stdcall" (this: ^ISvgElement, document: ^^ISvgDocument),
	GetTagName:                      proc "stdcall" (this: ^ISvgElement, name: [^]u8, nameCount: u32) -> HRESULT,
	GetTagNameLength:                proc "stdcall" (this: ^ISvgElement) -> u32,
	IsTextContent:                   proc "stdcall" (this: ^ISvgElement) -> BOOL,
	GetParent:                       proc "stdcall" (this: ^ISvgElement, parent: ^^ISvgElement),
	HasChildren:                     proc "stdcall" (this: ^ISvgElement) -> BOOL,
	GetFirstChild:                   proc "stdcall" (this: ^ISvgElement, child: ^^ISvgElement),
	GetLastChild:                    proc "stdcall" (this: ^ISvgElement, child: ^^ISvgElement),
	GetPreviousChild:                proc "stdcall" (this: ^ISvgElement, referenceChild: ^ISvgElement, previousChild: ^^ISvgElement) -> HRESULT,
	GetNextChild:                    proc "stdcall" (this: ^ISvgElement, referenceChild: ^ISvgElement, nextChild: ^^ISvgElement) -> HRESULT,
	InsertChildBefore:               proc "stdcall" (this: ^ISvgElement, newChild: ^ISvgElement, referenceChild: ^ISvgElement) -> HRESULT,
	AppendChild:                     proc "stdcall" (this: ^ISvgElement, newChild: ^ISvgElement) -> HRESULT,
	ReplaceChild:                    proc "stdcall" (this: ^ISvgElement, newChild: ^ISvgElement, oldChild: ^ISvgElement) -> HRESULT,
	RemoveChild:                     proc "stdcall" (this: ^ISvgElement, oldChild: ^ISvgElement) -> HRESULT,
	CreateChild:                     proc "stdcall" (this: ^ISvgElement, tagName: PWSTR, newChild: ^^ISvgElement) -> HRESULT,
	IsAttributeSpecified:            proc "stdcall" (this: ^ISvgElement, name: PWSTR, inherited: ^BOOL) -> BOOL,
	GetSpecifiedAttributeCount:      proc "stdcall" (this: ^ISvgElement) -> u32,
	GetSpecifiedAttributeName:       proc "stdcall" (this: ^ISvgElement, index: u32, name: [^]u8, nameCount: u32, inherited: ^BOOL) -> HRESULT,
	GetSpecifiedAttributeNameLength: proc "stdcall" (this: ^ISvgElement, index: u32, nameLength: ^u32, inherited: ^BOOL) -> HRESULT,
	RemoveAttribute:                 proc "stdcall" (this: ^ISvgElement, name: PWSTR) -> HRESULT,
	SetTextValue:                    proc "stdcall" (this: ^ISvgElement, name: [^]u8, nameCount: u32) -> HRESULT,
	GetTextValue:                    proc "stdcall" (this: ^ISvgElement, name: [^]u8, nameCount: u32) -> HRESULT,
	GetTextValueLength:              proc "stdcall" (this: ^ISvgElement) -> u32,
	SetAttributeValue:               proc "stdcall" (this: ^ISvgElement, name: PWSTR, value: ^ISvgAttribute) -> HRESULT,
	SetAttributeValue_1:             proc "stdcall" (this: ^ISvgElement, name: PWSTR, type: SVG_ATTRIBUTE_POD_TYPE, value: rawptr, valueSizeInBytes: u32) -> HRESULT,
	SetAttributeValue_2:             proc "stdcall" (this: ^ISvgElement, name: PWSTR, type: SVG_ATTRIBUTE_STRING_TYPE, value: PWSTR) -> HRESULT,
	GetAttributeValue:               proc "stdcall" (this: ^ISvgElement, name: PWSTR, #by_ptr riid: IID, value: ^rawptr) -> HRESULT,
	GetAttributeValue_1:             proc "stdcall" (this: ^ISvgElement, name: PWSTR, type: SVG_ATTRIBUTE_POD_TYPE, value: rawptr, valueSizeInBytes: u32) -> HRESULT,
	GetAttributeValue_2:             proc "stdcall" (this: ^ISvgElement, name: PWSTR, type: SVG_ATTRIBUTE_STRING_TYPE, value: [^]u8, valueCount: u32) -> HRESULT,
	GetAttributeValueLength:         proc "stdcall" (this: ^ISvgElement, name: PWSTR, type: SVG_ATTRIBUTE_STRING_TYPE, valueLength: ^u32) -> HRESULT,
}


ISvgDocument_UUID_STRING := "86b88e4d-afa4-4d7b-88e4-68a51c4a0aec"
ISvgDocument_UUID := IID{0x86b88e4d, 0xafa4, 0x4d7b, {0x88, 0xe4, 0x68, 0xa5, 0x1c, 0x4a, 0x0a, 0xec}}
ISvgDocument :: struct #raw_union {
	#subtype iresource:        IResource,
	using isvgdocument_vtable: ISvgDocument_VTable,
}
ISvgDocument_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	SetViewportSize:        proc "stdcall" (this: ^ISvgDocument, viewportSize: SIZE_F) -> HRESULT,
	GetViewportSize:        proc "stdcall" (this: ^ISvgDocument) -> SIZE_F,
	SetRoot:                proc "stdcall" (this: ^ISvgDocument, root: ^ISvgElement) -> HRESULT,
	GetRoot:                proc "stdcall" (this: ^ISvgDocument, root: ^^ISvgElement),
	FindElementById:        proc "stdcall" (this: ^ISvgDocument, id: PWSTR, svgElement: ^^ISvgElement) -> HRESULT,
	Serialize:              proc "stdcall" (this: ^ISvgDocument, outputXmlStream: ^IStream, subtree: ^ISvgElement) -> HRESULT,
	Deserialize:            proc "stdcall" (this: ^ISvgDocument, inputXmlStream: ^IStream, subtree: ^^ISvgElement) -> HRESULT,
	CreatePaint:            proc "stdcall" (this: ^ISvgDocument, paintType: SVG_PAINT_TYPE, color: ^COLOR_F, id: PWSTR, paint: ^^ISvgPaint) -> HRESULT,
	CreateStrokeDashArray:  proc "stdcall" (this: ^ISvgDocument, dashes: [^]SVG_LENGTH, dashesCount: u32, strokeDashArray: ^^ISvgStrokeDashArray) -> HRESULT,
	CreatePointCollection:  proc "stdcall" (this: ^ISvgDocument, points: [^]POINT_2F, pointsCount: u32, pointCollection: ^^ISvgPointCollection) -> HRESULT,
	CreatePathData:         proc "stdcall" (
		this: ^ISvgDocument,
		segmentData: [^]f32,
		segmentDataCount: u32,
		commands: [^]SVG_PATH_COMMAND,
		commandsCount: u32,
		pathData: ^^ISvgPathData,
	) -> HRESULT,
}


INK_NIB_SHAPE :: enum u32 {
	ROUND,
	SQUARE,
}

ORIENTATION :: enum u32 {
	DEFAULT                             = 1,
	FLIP_HORIZONTAL                     = 2,
	ROTATE_CLOCKWISE180                 = 3,
	ROTATE_CLOCKWISE180_FLIP_HORIZONTAL = 4,
	ROTATE_CLOCKWISE90_FLIP_HORIZONTAL  = 5,
	ROTATE_CLOCKWISE270                 = 6,
	ROTATE_CLOCKWISE270_FLIP_HORIZONTAL = 7,
	ROTATE_CLOCKWISE90                  = 8,
}

IMAGE_SOURCE_LOADING_OPTIONS_Flag :: enum {
	RELEASE_SOURCE  = 1,
	CACHE_ON_DEMAND = 2,
}
IMAGE_SOURCE_LOADING_OPTIONS :: bit_set[IMAGE_SOURCE_LOADING_OPTIONS_Flag;u32]

IMAGE_SOURCE_FROM_DXGI_OPTIONS_Flag :: enum {
	LOW_QUALITY_PRIMARY_CONVERSION = 1,
}
IMAGE_SOURCE_FROM_DXGI_OPTIONS :: bit_set[IMAGE_SOURCE_FROM_DXGI_OPTIONS_Flag;u32]

TRANSFORMED_IMAGE_SOURCE_OPTIONS_Flag :: enum {
	DISABLE_DPI_SCALE = 1,
}
TRANSFORMED_IMAGE_SOURCE_OPTIONS :: bit_set[TRANSFORMED_IMAGE_SOURCE_OPTIONS_Flag;u32]

TRANSFORMED_IMAGE_SOURCE_PROPERTIES :: struct {
	orientation:       ORIENTATION,
	scaleX:            f32,
	scaleY:            f32,
	interpolationMode: INTERPOLATION_MODE,
	options:           TRANSFORMED_IMAGE_SOURCE_OPTIONS,
}

INK_POINT :: struct {
	x:      f32,
	y:      f32,
	radius: f32,
}

INK_BEZIER_SEGMENT :: struct {
	point1: INK_POINT,
	point2: INK_POINT,
	point3: INK_POINT,
}

INK_STYLE_PROPERTIES :: struct {
	nibShape:     INK_NIB_SHAPE,
	nibTransform: MATRIX_3X2_F,
}

PATCH_EDGE_MODE :: enum u32 {
	ALIASED,
	ANTIALIASED,
	ALIASED_INFLATED,
}

GRADIENT_MESH_PATCH :: struct {
	point00:        POINT_2F,
	point01:        POINT_2F,
	point02:        POINT_2F,
	point03:        POINT_2F,
	point10:        POINT_2F,
	point11:        POINT_2F,
	point12:        POINT_2F,
	point13:        POINT_2F,
	point20:        POINT_2F,
	point21:        POINT_2F,
	point22:        POINT_2F,
	point23:        POINT_2F,
	point30:        POINT_2F,
	point31:        POINT_2F,
	point32:        POINT_2F,
	point33:        POINT_2F,
	color00:        COLOR_F,
	color03:        COLOR_F,
	color30:        COLOR_F,
	color33:        COLOR_F,
	topEdgeMode:    PATCH_EDGE_MODE,
	leftEdgeMode:   PATCH_EDGE_MODE,
	bottomEdgeMode: PATCH_EDGE_MODE,
	rightEdgeMode:  PATCH_EDGE_MODE,
}

SPRITE_OPTIONS_Flag :: enum {
	CLAMP_TO_SOURCE_RECTANGLE = 1,
}
SPRITE_OPTIONS :: bit_set[SPRITE_OPTIONS_Flag;u32]

COLOR_BITMAP_GLYPH_SNAP_OPTION :: enum u32 {
	DEFAULT,
	DISABLE,
}

GAMMA1 :: enum u32 {
	G22,
	G10,
	G2084,
}

SIMPLE_COLOR_PROFILE :: struct {
	redPrimary:   POINT_2F,
	greenPrimary: POINT_2F,
	bluePrimary:  POINT_2F,
	whitePointXZ: POINT_2F,
	gamma:        GAMMA1,
}

COLOR_CONTEXT_TYPE :: enum u32 {
	ICC,
	SIMPLE,
	DXGI,
}

IInk_UUID_STRING := "b499923b-7029-478f-a8b3-432c7c5f5312"
IInk_UUID := IID{0xb499923b, 0x7029, 0x478f, {0xa8, 0xb3, 0x43, 0x2c, 0x7c, 0x5f, 0x53, 0x12}}
IInk :: struct #raw_union {
	#subtype iresource: IResource,
	using iink_vtable: IInk_VTable,
}
IInk_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	SetStartPoint:          proc "stdcall" (this: ^IInk, #by_ptr startPoint: INK_POINT),
	GetStartPoint:          proc "stdcall" (this: ^IInk) -> INK_POINT,
	AddSegments:            proc "stdcall" (this: ^IInk, segments: [^]INK_BEZIER_SEGMENT, segmentsCount: u32) -> HRESULT,
	RemoveSegmentsAtEnd:    proc "stdcall" (this: ^IInk, segmentsCount: u32) -> HRESULT,
	SetSegments:            proc "stdcall" (this: ^IInk, startSegment: u32, segments: [^]INK_BEZIER_SEGMENT, segmentsCount: u32) -> HRESULT,
	SetSegmentAtEnd:        proc "stdcall" (this: ^IInk, #by_ptr segment: INK_BEZIER_SEGMENT) -> HRESULT,
	GetSegmentCount:        proc "stdcall" (this: ^IInk) -> u32,
	GetSegments:            proc "stdcall" (this: ^IInk, startSegment: u32, segments: [^]INK_BEZIER_SEGMENT, segmentsCount: u32) -> HRESULT,
	StreamAsGeometry:       proc "stdcall" (
		this: ^IInk,
		inkStyle: ^IInkStyle,
		worldTransform: ^MATRIX_3X2_F,
		flatteningTolerance: f32,
		geometrySink: ^ISimplifiedGeometrySink,
	) -> HRESULT,
	GetBounds:              proc "stdcall" (this: ^IInk, inkStyle: ^IInkStyle, worldTransform: ^MATRIX_3X2_F, bounds: ^RECT_F) -> HRESULT,
}


IInkStyle_UUID_STRING := "bae8b344-23fc-4071-8cb5-d05d6f073848"
IInkStyle_UUID := IID{0xbae8b344, 0x23fc, 0x4071, {0x8c, 0xb5, 0xd0, 0x5d, 0x6f, 0x07, 0x38, 0x48}}
IInkStyle :: struct #raw_union {
	#subtype iresource:     IResource,
	using iinkstyle_vtable: IInkStyle_VTable,
}
IInkStyle_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	SetNibTransform:        proc "stdcall" (this: ^IInkStyle, #by_ptr transform: MATRIX_3X2_F),
	GetNibTransform:        proc "stdcall" (this: ^IInkStyle, transform: ^MATRIX_3X2_F),
	SetNibShape:            proc "stdcall" (this: ^IInkStyle, nibShape: INK_NIB_SHAPE),
	GetNibShape:            proc "stdcall" (this: ^IInkStyle) -> INK_NIB_SHAPE,
}


IGradientMesh_UUID_STRING := "f292e401-c050-4cde-83d7-04962d3b23c2"
IGradientMesh_UUID := IID{0xf292e401, 0xc050, 0x4cde, {0x83, 0xd7, 0x04, 0x96, 0x2d, 0x3b, 0x23, 0xc2}}
IGradientMesh :: struct #raw_union {
	#subtype iresource:         IResource,
	using igradientmesh_vtable: IGradientMesh_VTable,
}
IGradientMesh_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	GetPatchCount:          proc "stdcall" (this: ^IGradientMesh) -> u32,
	GetPatches:             proc "stdcall" (this: ^IGradientMesh, startIndex: u32, patches: [^]GRADIENT_MESH_PATCH, patchesCount: u32) -> HRESULT,
}


IImageSource_UUID_STRING := "c9b664e5-74a1-4378-9ac2-eefc37a3f4d8"
IImageSource_UUID := IID{0xc9b664e5, 0x74a1, 0x4378, {0x9a, 0xc2, 0xee, 0xfc, 0x37, 0xa3, 0xf4, 0xd8}}
IImageSource :: struct #raw_union {
	#subtype iimage:           IImage,
	using iimagesource_vtable: IImageSource_VTable,
}
IImageSource_VTable :: struct {
	using iimage_vtable: IImage_VTable,
	OfferResources:      proc "stdcall" (this: ^IImageSource) -> HRESULT,
	TryReclaimResources: proc "stdcall" (this: ^IImageSource, resourcesDiscarded: ^BOOL) -> HRESULT,
}


IImageSourceFromWic_UUID_STRING := "77395441-1c8f-4555-8683-f50dab0fe792"
IImageSourceFromWic_UUID := IID{0x77395441, 0x1c8f, 0x4555, {0x86, 0x83, 0xf5, 0x0d, 0xab, 0x0f, 0xe7, 0x92}}
IImageSourceFromWic :: struct #raw_union {
	#subtype iimagesource:            IImageSource,
	using iimagesourcefromwic_vtable: IImageSourceFromWic_VTable,
}
IImageSourceFromWic_VTable :: struct {
	using iimagesource_vtable: IImageSource_VTable,
	EnsureCached:              proc "stdcall" (this: ^IImageSourceFromWic, rectangleToFill: ^RECT_U) -> HRESULT,
	TrimCache:                 proc "stdcall" (this: ^IImageSourceFromWic, rectangleToPreserve: ^RECT_U) -> HRESULT,
	GetSource:                 proc "stdcall" (this: ^IImageSourceFromWic, wicBitmapSource: ^^IWICBitmapSource),
}


ITransformedImageSource_UUID_STRING := "7f1f79e5-2796-416c-8f55-700f911445e5"
ITransformedImageSource_UUID := IID{0x7f1f79e5, 0x2796, 0x416c, {0x8f, 0x55, 0x70, 0x0f, 0x91, 0x14, 0x45, 0xe5}}
ITransformedImageSource :: struct #raw_union {
	#subtype iimage:                      IImage,
	using itransformedimagesource_vtable: ITransformedImageSource_VTable,
}
ITransformedImageSource_VTable :: struct {
	using iimage_vtable: IImage_VTable,
	GetSource:           proc "stdcall" (this: ^ITransformedImageSource, imageSource: ^^IImageSource),
	GetProperties:       proc "stdcall" (this: ^ITransformedImageSource, properties: ^TRANSFORMED_IMAGE_SOURCE_PROPERTIES),
}


ILookupTable3D_UUID_STRING := "53dd9855-a3b0-4d5b-82e1-26e25c5e5797"
ILookupTable3D_UUID := IID{0x53dd9855, 0xa3b0, 0x4d5b, {0x82, 0xe1, 0x26, 0xe2, 0x5c, 0x5e, 0x57, 0x97}}
ILookupTable3D :: struct #raw_union {
	#subtype iresource:          IResource,
	using ilookuptable3d_vtable: ILookupTable3D_VTable,
}
ILookupTable3D_VTable :: struct {
	using iresource_vtable: IResource_VTable,
}


IDeviceContext2_UUID_STRING := "394ea6a3-0c34-4321-950b-6ca20f0be6c7"
IDeviceContext2_UUID := IID{0x394ea6a3, 0x0c34, 0x4321, {0x95, 0x0b, 0x6c, 0xa2, 0x0f, 0x0b, 0xe6, 0xc7}}
IDeviceContext2 :: struct #raw_union {
	#subtype idevicecontext1:     IDeviceContext1,
	using idevicecontext2_vtable: IDeviceContext2_VTable,
}
IDeviceContext2_VTable :: struct {
	using idevicecontext1_vtable: IDeviceContext1_VTable,
	CreateInk:                    proc "stdcall" (this: ^IDeviceContext2, #by_ptr startPoint: INK_POINT, ink: ^^IInk) -> HRESULT,
	CreateInkStyle:               proc "stdcall" (this: ^IDeviceContext2, inkStyleProperties: ^INK_STYLE_PROPERTIES, inkStyle: ^^IInkStyle) -> HRESULT,
	CreateGradientMesh:           proc "stdcall" (this: ^IDeviceContext2, patches: [^]GRADIENT_MESH_PATCH, patchesCount: u32, gradientMesh: ^^IGradientMesh) -> HRESULT,
	CreateImageSourceFromWic:     proc "stdcall" (
		this: ^IDeviceContext2,
		wicBitmapSource: ^IWICBitmapSource,
		loadingOptions: IMAGE_SOURCE_LOADING_OPTIONS,
		alphaMode: ALPHA_MODE,
		imageSource: ^^IImageSourceFromWic,
	) -> HRESULT,
	CreateLookupTable3D:          proc "stdcall" (
		this: ^IDeviceContext2,
		precision: BUFFER_PRECISION,
		extents: [^]u32,
		data: [^]u8,
		dataCount: u32,
		strides: [^]u32,
		lookupTable: ^^ILookupTable3D,
	) -> HRESULT,
	CreateImageSourceFromDxgi:    proc "stdcall" (
		this: ^IDeviceContext2,
		surfaces: [^]^dxgi.ISurface,
		surfaceCount: u32,
		colorSpace: dxgi.COLOR_SPACE_TYPE,
		options: IMAGE_SOURCE_FROM_DXGI_OPTIONS,
		imageSource: ^^IImageSource,
	) -> HRESULT,
	GetGradientMeshWorldBounds:   proc "stdcall" (this: ^IDeviceContext2, gradientMesh: ^IGradientMesh, pBounds: ^RECT_F) -> HRESULT,
	DrawInk:                      proc "stdcall" (this: ^IDeviceContext2, ink: ^IInk, brush: ^IBrush, inkStyle: ^IInkStyle),
	DrawGradientMesh:             proc "stdcall" (this: ^IDeviceContext2, gradientMesh: ^IGradientMesh),
	DrawGdiMetafile2:             proc "stdcall" (this: ^IDeviceContext2, gdiMetafile: ^IGdiMetafile, destinationRectangle: ^RECT_F, sourceRectangle: ^RECT_F),
	CreateTransformedImageSource: proc "stdcall" (
		this: ^IDeviceContext2,
		imageSource: ^IImageSource,
		#by_ptr properties: TRANSFORMED_IMAGE_SOURCE_PROPERTIES,
		transformedImageSource: ^^ITransformedImageSource,
	) -> HRESULT,
}


IDevice2_UUID_STRING := "a44472e1-8dfb-4e60-8492-6e2861c9ca8b"
IDevice2_UUID := IID{0xa44472e1, 0x8dfb, 0x4e60, {0x84, 0x92, 0x6e, 0x28, 0x61, 0xc9, 0xca, 0x8b}}
IDevice2 :: struct #raw_union {
	#subtype idevice1:     IDevice1,
	using idevice2_vtable: IDevice2_VTable,
}
IDevice2_VTable :: struct {
	using idevice1_vtable: IDevice1_VTable,
	CreateDeviceContext2:  proc "stdcall" (this: ^IDevice2, options: DEVICE_CONTEXT_OPTIONS, deviceContext2: ^^IDeviceContext2) -> HRESULT,
	FlushDeviceContexts:   proc "stdcall" (this: ^IDevice2, bitmap: ^IBitmap),
	GetDxgiDevice:         proc "stdcall" (this: ^IDevice2, dxgiDevice: ^^dxgi.IDevice) -> HRESULT,
}


IFactory3_UUID_STRING := "0869759f-4f00-413f-b03e-2bda45404d0f"
IFactory3_UUID := IID{0x0869759f, 0x4f00, 0x413f, {0xb0, 0x3e, 0x2b, 0xda, 0x45, 0x40, 0x4d, 0x0f}}
IFactory3 :: struct #raw_union {
	#subtype ifactory2:     IFactory2,
	using ifactory3_vtable: IFactory3_VTable,
}
IFactory3_VTable :: struct {
	using ifactory2_vtable: IFactory2_VTable,
	CreateDevice3:          proc "stdcall" (this: ^IFactory3, dxgiDevice: ^dxgi.IDevice, d2dDevice2: ^^IDevice2) -> HRESULT,
}


ICommandSink2_UUID_STRING := "3bab440e-417e-47df-a2e2-bc0be6a00916"
ICommandSink2_UUID := IID{0x3bab440e, 0x417e, 0x47df, {0xa2, 0xe2, 0xbc, 0x0b, 0xe6, 0xa0, 0x09, 0x16}}
ICommandSink2 :: struct #raw_union {
	#subtype icommandsink1:     ICommandSink1,
	using icommandsink2_vtable: ICommandSink2_VTable,
}
ICommandSink2_VTable :: struct {
	using icommandsink1_vtable: ICommandSink1_VTable,
	DrawInk:                    proc "stdcall" (this: ^ICommandSink2, ink: ^IInk, brush: ^IBrush, inkStyle: ^IInkStyle) -> HRESULT,
	DrawGradientMesh:           proc "stdcall" (this: ^ICommandSink2, gradientMesh: ^IGradientMesh) -> HRESULT,
	DrawGdiMetafile2:           proc "stdcall" (this: ^ICommandSink2, gdiMetafile: ^IGdiMetafile, destinationRectangle: ^RECT_F, sourceRectangle: ^RECT_F) -> HRESULT,
}


IGdiMetafile1_UUID_STRING := "2e69f9e8-dd3f-4bf9-95ba-c04f49d788df"
IGdiMetafile1_UUID := IID{0x2e69f9e8, 0xdd3f, 0x4bf9, {0x95, 0xba, 0xc0, 0x4f, 0x49, 0xd7, 0x88, 0xdf}}
IGdiMetafile1 :: struct #raw_union {
	#subtype igdimetafile:      IGdiMetafile,
	using igdimetafile1_vtable: IGdiMetafile1_VTable,
}
IGdiMetafile1_VTable :: struct {
	using igdimetafile_vtable: IGdiMetafile_VTable,
	GetDpi:                    proc "stdcall" (this: ^IGdiMetafile1, dpiX: ^f32, dpiY: ^f32) -> HRESULT,
	GetSourceBounds:           proc "stdcall" (this: ^IGdiMetafile1, bounds: ^RECT_F) -> HRESULT,
}


IGdiMetafileSink1_UUID_STRING := "fd0ecb6b-91e6-411e-8655-395e760f91b4"
IGdiMetafileSink1_UUID := IID{0xfd0ecb6b, 0x91e6, 0x411e, {0x86, 0x55, 0x39, 0x5e, 0x76, 0x0f, 0x91, 0xb4}}
IGdiMetafileSink1 :: struct #raw_union {
	#subtype igdimetafilesink:      IGdiMetafileSink,
	using igdimetafilesink1_vtable: IGdiMetafileSink1_VTable,
}
IGdiMetafileSink1_VTable :: struct {
	using igdimetafilesink_vtable: IGdiMetafileSink_VTable,
	ProcessRecord1:                proc "stdcall" (this: ^IGdiMetafileSink1, recordType: u32, recordData: rawptr, recordDataSize: u32, flags: u32) -> HRESULT,
}


ISpriteBatch_UUID_STRING := "4dc583bf-3a10-438a-8722-e9765224f1f1"
ISpriteBatch_UUID := IID{0x4dc583bf, 0x3a10, 0x438a, {0x87, 0x22, 0xe9, 0x76, 0x52, 0x24, 0xf1, 0xf1}}
ISpriteBatch :: struct #raw_union {
	#subtype iresource:        IResource,
	using ispritebatch_vtable: ISpriteBatch_VTable,
}
ISpriteBatch_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	AddSprites:             proc "stdcall" (
		this: ^ISpriteBatch,
		spriteCount: u32,
		#by_ptr destinationRectangles: RECT_F,
		sourceRectangles: ^RECT_U,
		colors: ^COLOR_F,
		transforms: ^MATRIX_3X2_F,
		destinationRectanglesStride: u32,
		sourceRectanglesStride: u32,
		colorsStride: u32,
		transformsStride: u32,
	) -> HRESULT,
	SetSprites:             proc "stdcall" (
		this: ^ISpriteBatch,
		startIndex: u32,
		spriteCount: u32,
		destinationRectangles: ^RECT_F,
		sourceRectangles: ^RECT_U,
		colors: ^COLOR_F,
		transforms: ^MATRIX_3X2_F,
		destinationRectanglesStride: u32,
		sourceRectanglesStride: u32,
		colorsStride: u32,
		transformsStride: u32,
	) -> HRESULT,
	GetSprites:             proc "stdcall" (
		this: ^ISpriteBatch,
		startIndex: u32,
		spriteCount: u32,
		destinationRectangles: [^]RECT_F,
		sourceRectangles: [^]RECT_U,
		colors: [^]COLOR_F,
		transforms: [^]MATRIX_3X2_F,
	) -> HRESULT,
	GetSpriteCount:         proc "stdcall" (this: ^ISpriteBatch) -> u32,
	Clear:                  proc "stdcall" (this: ^ISpriteBatch),
}


IDeviceContext3_UUID_STRING := "235a7496-8351-414c-bcd4-6672ab2d8e00"
IDeviceContext3_UUID := IID{0x235a7496, 0x8351, 0x414c, {0xbc, 0xd4, 0x66, 0x72, 0xab, 0x2d, 0x8e, 0x00}}
IDeviceContext3 :: struct #raw_union {
	#subtype idevicecontext2:     IDeviceContext2,
	using idevicecontext3_vtable: IDeviceContext3_VTable,
}
IDeviceContext3_VTable :: struct {
	using idevicecontext2_vtable: IDeviceContext2_VTable,
	CreateSpriteBatch:            proc "stdcall" (this: ^IDeviceContext3, spriteBatch: ^^ISpriteBatch) -> HRESULT,
	DrawSpriteBatch:              proc "stdcall" (
		this: ^IDeviceContext3,
		spriteBatch: ^ISpriteBatch,
		startIndex: u32,
		spriteCount: u32,
		bitmap: ^IBitmap,
		interpolationMode: BITMAP_INTERPOLATION_MODE,
		spriteOptions: SPRITE_OPTIONS,
	),
}


IDevice3_UUID_STRING := "852f2087-802c-4037-ab60-ff2e7ee6fc01"
IDevice3_UUID := IID{0x852f2087, 0x802c, 0x4037, {0xab, 0x60, 0xff, 0x2e, 0x7e, 0xe6, 0xfc, 0x01}}
IDevice3 :: struct #raw_union {
	#subtype idevice2:     IDevice2,
	using idevice3_vtable: IDevice3_VTable,
}
IDevice3_VTable :: struct {
	using idevice2_vtable: IDevice2_VTable,
	CreateDeviceContext3:  proc "stdcall" (this: ^IDevice3, options: DEVICE_CONTEXT_OPTIONS, deviceContext3: ^^IDeviceContext3) -> HRESULT,
}


IFactory4_UUID_STRING := "bd4ec2d2-0662-4bee-ba8e-6f29f032e096"
IFactory4_UUID := IID{0xbd4ec2d2, 0x0662, 0x4bee, {0xba, 0x8e, 0x6f, 0x29, 0xf0, 0x32, 0xe0, 0x96}}
IFactory4 :: struct #raw_union {
	#subtype ifactory3:     IFactory3,
	using ifactory4_vtable: IFactory4_VTable,
}
IFactory4_VTable :: struct {
	using ifactory3_vtable: IFactory3_VTable,
	CreateDevice4:          proc "stdcall" (this: ^IFactory4, dxgiDevice: ^dxgi.IDevice, d2dDevice3: ^^IDevice3) -> HRESULT,
}


ICommandSink3_UUID_STRING := "18079135-4cf3-4868-bc8e-06067e6d242d"
ICommandSink3_UUID := IID{0x18079135, 0x4cf3, 0x4868, {0xbc, 0x8e, 0x06, 0x06, 0x7e, 0x6d, 0x24, 0x2d}}
ICommandSink3 :: struct #raw_union {
	#subtype icommandsink2:     ICommandSink2,
	using icommandsink3_vtable: ICommandSink3_VTable,
}
ICommandSink3_VTable :: struct {
	using icommandsink2_vtable: ICommandSink2_VTable,
	DrawSpriteBatch:            proc "stdcall" (
		this: ^ICommandSink3,
		spriteBatch: ^ISpriteBatch,
		startIndex: u32,
		spriteCount: u32,
		bitmap: ^IBitmap,
		interpolationMode: BITMAP_INTERPOLATION_MODE,
		spriteOptions: SPRITE_OPTIONS,
	) -> HRESULT,
}


ISvgGlyphStyle_UUID_STRING := "af671749-d241-4db8-8e41-dcc2e5c1a438"
ISvgGlyphStyle_UUID := IID{0xaf671749, 0xd241, 0x4db8, {0x8e, 0x41, 0xdc, 0xc2, 0xe5, 0xc1, 0xa4, 0x38}}
ISvgGlyphStyle :: struct #raw_union {
	#subtype iresource:          IResource,
	using isvgglyphstyle_vtable: ISvgGlyphStyle_VTable,
}
ISvgGlyphStyle_VTable :: struct {
	using iresource_vtable: IResource_VTable,
	SetFill:                proc "stdcall" (this: ^ISvgGlyphStyle, brush: ^IBrush) -> HRESULT,
	GetFill:                proc "stdcall" (this: ^ISvgGlyphStyle, brush: ^^IBrush),
	SetStroke:              proc "stdcall" (this: ^ISvgGlyphStyle, brush: ^IBrush, strokeWidth: f32, dashes: [^]f32, dashesCount: u32, dashOffset: f32) -> HRESULT,
	GetStrokeDashesCount:   proc "stdcall" (this: ^ISvgGlyphStyle) -> u32,
	GetStroke:              proc "stdcall" (this: ^ISvgGlyphStyle, brush: ^^IBrush, strokeWidth: ^f32, dashes: [^]f32, dashesCount: u32, dashOffset: ^f32),
}


IDeviceContext4_UUID_STRING := "8c427831-3d90-4476-b647-c4fae349e4db"
IDeviceContext4_UUID := IID{0x8c427831, 0x3d90, 0x4476, {0xb6, 0x47, 0xc4, 0xfa, 0xe3, 0x49, 0xe4, 0xdb}}
IDeviceContext4 :: struct #raw_union {
	#subtype idevicecontext3:     IDeviceContext3,
	using idevicecontext4_vtable: IDeviceContext4_VTable,
}
IDeviceContext4_VTable :: struct {
	using idevicecontext3_vtable: IDeviceContext3_VTable,
	CreateSvgGlyphStyle:          proc "stdcall" (this: ^IDeviceContext4, svgGlyphStyle: ^^ISvgGlyphStyle) -> HRESULT,
	DrawText4:                    proc "stdcall" (
		this: ^IDeviceContext4,
		string: [^]u8,
		stringLength: u32,
		textFormat: ^dwrite.ITextFormat,
		#by_ptr layoutRect: RECT_F,
		defaultFillBrush: ^IBrush,
		svgGlyphStyle: ^ISvgGlyphStyle,
		colorPaletteIndex: u32,
		options: DRAW_TEXT_OPTIONS,
		measuringMode: dwrite.MEASURING_MODE,
	),
	DrawTextLayout4:              proc "stdcall" (
		this: ^IDeviceContext4,
		origin: POINT_2F,
		textLayout: ^dwrite.ITextLayout,
		defaultFillBrush: ^IBrush,
		svgGlyphStyle: ^ISvgGlyphStyle,
		colorPaletteIndex: u32,
		options: DRAW_TEXT_OPTIONS,
	),
	DrawColorBitmapGlyphRun:      proc "stdcall" (
		this: ^IDeviceContext4,
		glyphImageFormat: dwrite.GLYPH_IMAGE_FORMATS,
		baselineOrigin: POINT_2F,
		#by_ptr glyphRun: dwrite.GLYPH_RUN,
		measuringMode: dwrite.MEASURING_MODE,
		bitmapSnapOption: COLOR_BITMAP_GLYPH_SNAP_OPTION,
	),
	DrawSvgGlyphRun:              proc "stdcall" (
		this: ^IDeviceContext4,
		baselineOrigin: POINT_2F,
		#by_ptr glyphRun: dwrite.GLYPH_RUN,
		defaultFillBrush: ^IBrush,
		svgGlyphStyle: ^ISvgGlyphStyle,
		colorPaletteIndex: u32,
		measuringMode: dwrite.MEASURING_MODE,
	),
	GetColorBitmapGlyphImage:     proc "stdcall" (
		this: ^IDeviceContext4,
		glyphImageFormat: dwrite.GLYPH_IMAGE_FORMATS,
		glyphOrigin: POINT_2F,
		fontFace: ^dwrite.IFontFace,
		fontEmSize: f32,
		glyphIndex: u16,
		isSideways: BOOL,
		worldTransform: ^MATRIX_3X2_F,
		dpiX: f32,
		dpiY: f32,
		glyphTransform: ^MATRIX_3X2_F,
		glyphImage: ^^IImage,
	) -> HRESULT,
	GetSvgGlyphImage:             proc "stdcall" (
		this: ^IDeviceContext4,
		glyphOrigin: POINT_2F,
		fontFace: ^dwrite.IFontFace,
		fontEmSize: f32,
		glyphIndex: u16,
		isSideways: BOOL,
		worldTransform: ^MATRIX_3X2_F,
		defaultFillBrush: ^IBrush,
		svgGlyphStyle: ^ISvgGlyphStyle,
		colorPaletteIndex: u32,
		glyphTransform: ^MATRIX_3X2_F,
		glyphImage: ^^ICommandList,
	) -> HRESULT,
}


IDevice4_UUID_STRING := "d7bdb159-5683-4a46-bc9c-72dc720b858b"
IDevice4_UUID := IID{0xd7bdb159, 0x5683, 0x4a46, {0xbc, 0x9c, 0x72, 0xdc, 0x72, 0x0b, 0x85, 0x8b}}
IDevice4 :: struct #raw_union {
	#subtype idevice3:     IDevice3,
	using idevice4_vtable: IDevice4_VTable,
}
IDevice4_VTable :: struct {
	using idevice3_vtable:           IDevice3_VTable,
	CreateDeviceContext4:            proc "stdcall" (this: ^IDevice4, options: DEVICE_CONTEXT_OPTIONS, deviceContext4: ^^IDeviceContext4) -> HRESULT,
	SetMaximumColorGlyphCacheMemory: proc "stdcall" (this: ^IDevice4, maximumInBytes: u64),
	GetMaximumColorGlyphCacheMemory: proc "stdcall" (this: ^IDevice4) -> u64,
}


IFactory5_UUID_STRING := "c4349994-838e-4b0f-8cab-44997d9eeacc"
IFactory5_UUID := IID{0xc4349994, 0x838e, 0x4b0f, {0x8c, 0xab, 0x44, 0x99, 0x7d, 0x9e, 0xea, 0xcc}}
IFactory5 :: struct #raw_union {
	#subtype ifactory4:     IFactory4,
	using ifactory5_vtable: IFactory5_VTable,
}
IFactory5_VTable :: struct {
	using ifactory4_vtable: IFactory4_VTable,
	CreateDevice5:          proc "stdcall" (this: ^IFactory5, dxgiDevice: ^dxgi.IDevice, d2dDevice4: ^^IDevice4) -> HRESULT,
}


ICommandSink4_UUID_STRING := "c78a6519-40d6-4218-b2de-beeeb744bb3e"
ICommandSink4_UUID := IID{0xc78a6519, 0x40d6, 0x4218, {0xb2, 0xde, 0xbe, 0xee, 0xb7, 0x44, 0xbb, 0x3e}}
ICommandSink4 :: struct #raw_union {
	#subtype icommandsink3:     ICommandSink3,
	using icommandsink4_vtable: ICommandSink4_VTable,
}
ICommandSink4_VTable :: struct {
	using icommandsink3_vtable: ICommandSink3_VTable,
	SetPrimitiveBlend2:         proc "stdcall" (this: ^ICommandSink4, primitiveBlend: PRIMITIVE_BLEND) -> HRESULT,
}


IColorContext1_UUID_STRING := "1ab42875-c57f-4be9-bd85-9cd78d6f55ee"
IColorContext1_UUID := IID{0x1ab42875, 0xc57f, 0x4be9, {0xbd, 0x85, 0x9c, 0xd7, 0x8d, 0x6f, 0x55, 0xee}}
IColorContext1 :: struct #raw_union {
	#subtype icolorcontext:      IColorContext,
	using icolorcontext1_vtable: IColorContext1_VTable,
}
IColorContext1_VTable :: struct {
	using icolorcontext_vtable: IColorContext_VTable,
	GetColorContextType:        proc "stdcall" (this: ^IColorContext1) -> COLOR_CONTEXT_TYPE,
	GetDXGIColorSpace:          proc "stdcall" (this: ^IColorContext1) -> dxgi.COLOR_SPACE_TYPE,
	GetSimpleColorProfile:      proc "stdcall" (this: ^IColorContext1, simpleProfile: ^SIMPLE_COLOR_PROFILE) -> HRESULT,
}


IDeviceContext5_UUID_STRING := "7836d248-68cc-4df6-b9e8-de991bf62eb7"
IDeviceContext5_UUID := IID{0x7836d248, 0x68cc, 0x4df6, {0xb9, 0xe8, 0xde, 0x99, 0x1b, 0xf6, 0x2e, 0xb7}}
IDeviceContext5 :: struct #raw_union {
	#subtype idevicecontext4:     IDeviceContext4,
	using idevicecontext5_vtable: IDeviceContext5_VTable,
}
IDeviceContext5_VTable :: struct {
	using idevicecontext4_vtable:             IDeviceContext4_VTable,
	CreateSvgDocument:                        proc "stdcall" (this: ^IDeviceContext5, inputXmlStream: ^IStream, viewportSize: SIZE_F, svgDocument: ^^ISvgDocument) -> HRESULT,
	DrawSvgDocument:                          proc "stdcall" (this: ^IDeviceContext5, svgDocument: ^ISvgDocument),
	CreateColorContextFromDxgiColorSpace:     proc "stdcall" (this: ^IDeviceContext5, colorSpace: dxgi.COLOR_SPACE_TYPE, colorContext: ^^IColorContext1) -> HRESULT,
	CreateColorContextFromSimpleColorProfile: proc "stdcall" (this: ^IDeviceContext5, #by_ptr simpleProfile: SIMPLE_COLOR_PROFILE, colorContext: ^^IColorContext1) -> HRESULT,
}


IDevice5_UUID_STRING := "d55ba0a4-6405-4694-aef5-08ee1a4358b4"
IDevice5_UUID := IID{0xd55ba0a4, 0x6405, 0x4694, {0xae, 0xf5, 0x08, 0xee, 0x1a, 0x43, 0x58, 0xb4}}
IDevice5 :: struct #raw_union {
	#subtype idevice4:     IDevice4,
	using idevice5_vtable: IDevice5_VTable,
}
IDevice5_VTable :: struct {
	using idevice4_vtable: IDevice4_VTable,
	CreateDeviceContext5:  proc "stdcall" (this: ^IDevice5, options: DEVICE_CONTEXT_OPTIONS, deviceContext5: ^^IDeviceContext5) -> HRESULT,
}


IFactory6_UUID_STRING := "f9976f46-f642-44c1-97ca-da32ea2a2635"
IFactory6_UUID := IID{0xf9976f46, 0xf642, 0x44c1, {0x97, 0xca, 0xda, 0x32, 0xea, 0x2a, 0x26, 0x35}}
IFactory6 :: struct #raw_union {
	#subtype ifactory5:     IFactory5,
	using ifactory6_vtable: IFactory6_VTable,
}
IFactory6_VTable :: struct {
	using ifactory5_vtable: IFactory5_VTable,
	CreateDevice6:          proc "stdcall" (this: ^IFactory6, dxgiDevice: ^dxgi.IDevice, d2dDevice5: ^^IDevice5) -> HRESULT,
}


ICommandSink5_UUID_STRING := "7047dd26-b1e7-44a7-959a-8349e2144fa8"
ICommandSink5_UUID := IID{0x7047dd26, 0xb1e7, 0x44a7, {0x95, 0x9a, 0x83, 0x49, 0xe2, 0x14, 0x4f, 0xa8}}
ICommandSink5 :: struct #raw_union {
	#subtype icommandsink4:     ICommandSink4,
	using icommandsink5_vtable: ICommandSink5_VTable,
}
ICommandSink5_VTable :: struct {
	using icommandsink4_vtable: ICommandSink4_VTable,
	BlendImage:                 proc "stdcall" (
		this: ^ICommandSink5,
		image: ^IImage,
		blendMode: d2d_common.BLEND_MODE,
		targetOffset: ^POINT_2F,
		imageRectangle: ^RECT_F,
		interpolationMode: INTERPOLATION_MODE,
	) -> HRESULT,
}


IDeviceContext6_UUID_STRING := "985f7e37-4ed0-4a19-98a3-15b0edfde306"
IDeviceContext6_UUID := IID{0x985f7e37, 0x4ed0, 0x4a19, {0x98, 0xa3, 0x15, 0xb0, 0xed, 0xfd, 0xe3, 0x06}}
IDeviceContext6 :: struct #raw_union {
	#subtype idevicecontext5:     IDeviceContext5,
	using idevicecontext6_vtable: IDeviceContext6_VTable,
}
IDeviceContext6_VTable :: struct {
	using idevicecontext5_vtable: IDeviceContext5_VTable,
	BlendImage:                   proc "stdcall" (
		this: ^IDeviceContext6,
		image: ^IImage,
		blendMode: d2d_common.BLEND_MODE,
		targetOffset: ^POINT_2F,
		imageRectangle: ^RECT_F,
		interpolationMode: INTERPOLATION_MODE,
	),
}


IDevice6_UUID_STRING := "7bfef914-2d75-4bad-be87-e18ddb077b6d"
IDevice6_UUID := IID{0x7bfef914, 0x2d75, 0x4bad, {0xbe, 0x87, 0xe1, 0x8d, 0xdb, 0x07, 0x7b, 0x6d}}
IDevice6 :: struct #raw_union {
	#subtype idevice5:     IDevice5,
	using idevice6_vtable: IDevice6_VTable,
}
IDevice6_VTable :: struct {
	using idevice5_vtable: IDevice5_VTable,
	CreateDeviceContext6:  proc "stdcall" (this: ^IDevice6, options: DEVICE_CONTEXT_OPTIONS, deviceContext6: ^^IDeviceContext6) -> HRESULT,
}


IFactory7_UUID_STRING := "bdc2bdd3-b96c-4de6-bdf7-99d4745454de"
IFactory7_UUID := IID{0xbdc2bdd3, 0xb96c, 0x4de6, {0xbd, 0xf7, 0x99, 0xd4, 0x74, 0x54, 0x54, 0xde}}
IFactory7 :: struct #raw_union {
	#subtype ifactory6:     IFactory6,
	using ifactory7_vtable: IFactory7_VTable,
}
IFactory7_VTable :: struct {
	using ifactory6_vtable: IFactory6_VTable,
	CreateDevice7:          proc "stdcall" (this: ^IFactory7, dxgiDevice: ^dxgi.IDevice, d2dDevice6: ^^IDevice6) -> HRESULT,
}


IEffectContext1_UUID_STRING := "84ab595a-fc81-4546-bacd-e8ef4d8abe7a"
IEffectContext1_UUID := IID{0x84ab595a, 0xfc81, 0x4546, {0xba, 0xcd, 0xe8, 0xef, 0x4d, 0x8a, 0xbe, 0x7a}}
IEffectContext1 :: struct #raw_union {
	#subtype ieffectcontext:      IEffectContext,
	using ieffectcontext1_vtable: IEffectContext1_VTable,
}
IEffectContext1_VTable :: struct {
	using ieffectcontext_vtable: IEffectContext_VTable,
	CreateLookupTable3D:         proc "stdcall" (
		this: ^IEffectContext1,
		precision: BUFFER_PRECISION,
		extents: [^]u32,
		data: [^]u8,
		dataCount: u32,
		strides: [^]u32,
		lookupTable: ^^ILookupTable3D,
	) -> HRESULT,
}


IEffectContext2_UUID_STRING := "577ad2a0-9fc7-4dda-8b18-dab810140052"
IEffectContext2_UUID := IID{0x577ad2a0, 0x9fc7, 0x4dda, {0x8b, 0x18, 0xda, 0xb8, 0x10, 0x14, 0x00, 0x52}}
IEffectContext2 :: struct #raw_union {
	#subtype ieffectcontext1:     IEffectContext1,
	using ieffectcontext2_vtable: IEffectContext2_VTable,
}
IEffectContext2_VTable :: struct {
	using ieffectcontext1_vtable:             IEffectContext1_VTable,
	CreateColorContextFromDxgiColorSpace:     proc "stdcall" (this: ^IEffectContext2, colorSpace: dxgi.COLOR_SPACE_TYPE, colorContext: ^^IColorContext1) -> HRESULT,
	CreateColorContextFromSimpleColorProfile: proc "stdcall" (this: ^IEffectContext2, #by_ptr simpleProfile: SIMPLE_COLOR_PROFILE, colorContext: ^^IColorContext1) -> HRESULT,
}
