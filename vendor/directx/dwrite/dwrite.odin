package directx_dwrite

foreign import DWrite "system:DWrite.lib"

@(default_calling_convention = "stdcall", link_prefix = "DWrite")
foreign DWrite {
	CreateFactory :: proc(factoryType: FACTORY_TYPE, #by_ptr iid: IID, factory: ^^IUnknown) -> HRESULT ---
}
