package d2d1

import "../dxgi"

foreign import d2d1 "system:d2d1.lib"

@(default_calling_convention = "stdcall", link_prefix = "D2D1")
foreign d2d1 {
	CreateFactory :: proc(factoryType: FACTORY_TYPE, #by_ptr riid: IID, pFactoryOptions: ^FACTORY_OPTIONS, ppIFactory: ^rawptr) -> HRESULT ---
	MakeRotateMatrix :: proc(angle: f32, center: POINT_2F, matrix_: ^MATRIX_3X2_F) ---
	MakeSkewMatrix :: proc(angleX: f32, angleY: f32, center: POINT_2F, matrix_: ^MATRIX_3X2_F) ---
	IsMatrixInvertible :: proc(#by_ptr matrix_: MATRIX_3X2_F) -> BOOL ---
	InvertMatrix :: proc(matrix_: ^MATRIX_3X2_F) -> BOOL ---
	CreateDevice :: proc(dxgiDevice: ^dxgi.IDevice, creationProperties: ^CREATION_PROPERTIES, device: ^^IDevice) -> HRESULT ---
	CreateDeviceContext :: proc(dxgiSurface: ^dxgi.ISurface, creationProperties: ^CREATION_PROPERTIES, deviceContext: ^^IDeviceContext) -> HRESULT ---
	ConvertColorSpace :: proc(sourceColorSpace: COLOR_SPACE, destinationColorSpace: COLOR_SPACE, #by_ptr color: COLOR_F) -> COLOR_F ---
	SinCos :: proc(angle: f32, s: ^f32, c: ^f32) ---
	Tan :: proc(angle: f32) -> f32 ---
	Vec3Length :: proc(x: f32, y: f32, z: f32) -> f32 ---
	ComputeMaximumScaleFactor :: proc(#by_ptr matrix_: MATRIX_3X2_F) -> f32 ---
	GetGradientMeshInteriorPointsFromCoonsPatch :: proc(#by_ptr pPoint0: POINT_2F, #by_ptr pPoint1: POINT_2F, #by_ptr pPoint2: POINT_2F, #by_ptr pPoint3: POINT_2F, #by_ptr pPoint4: POINT_2F, #by_ptr pPoint5: POINT_2F, #by_ptr pPoint6: POINT_2F, #by_ptr pPoint7: POINT_2F, #by_ptr pPoint8: POINT_2F, #by_ptr pPoint9: POINT_2F, #by_ptr pPoint10: POINT_2F, #by_ptr pPoint11: POINT_2F, pTensorPoint11: ^POINT_2F, pTensorPoint12: ^POINT_2F, pTensorPoint21: ^POINT_2F, pTensorPoint22: ^POINT_2F) ---
}
