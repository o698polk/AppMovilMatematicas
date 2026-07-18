; ModuleID = 'compressed_assemblies.x86_64.ll'
source_filename = "compressed_assemblies.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.CompressedAssemblies = type {
	i32, ; uint32_t count
	ptr ; CompressedAssemblyDescriptor descriptors
}

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	ptr ; uint8_t data
}

@compressed_assemblies = dso_local local_unnamed_addr global %struct.CompressedAssemblies {
	i32 343, ; uint32_t count
	ptr @compressed_assembly_descriptors; CompressedAssemblyDescriptor* descriptors
}, align 8

@compressed_assembly_descriptors = internal dso_local global [343 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 308736, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_0; uint8_t* data
	}, ; 0: MauiApp2
	%struct.CompressedAssemblyDescriptor {
		i32 401704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_1; uint8_t* data
	}, ; 1: CommunityToolkit.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 166184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_2; uint8_t* data
	}, ; 2: CommunityToolkit.Maui.Core
	%struct.CompressedAssemblyDescriptor {
		i32 164912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_3; uint8_t* data
	}, ; 3: GoogleGson
	%struct.CompressedAssemblyDescriptor {
		i32 51504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_4; uint8_t* data
	}, ; 4: Microsoft.AspNetCore.Authorization
	%struct.CompressedAssemblyDescriptor {
		i32 342312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_5; uint8_t* data
	}, ; 5: Microsoft.AspNetCore.Components
	%struct.CompressedAssemblyDescriptor {
		i32 45856, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_6; uint8_t* data
	}, ; 6: Microsoft.AspNetCore.Components.Forms
	%struct.CompressedAssemblyDescriptor {
		i32 188176, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_7; uint8_t* data
	}, ; 7: Microsoft.AspNetCore.Components.Web
	%struct.CompressedAssemblyDescriptor {
		i32 162080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_8; uint8_t* data
	}, ; 8: Microsoft.AspNetCore.Components.WebView
	%struct.CompressedAssemblyDescriptor {
		i32 71480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_9; uint8_t* data
	}, ; 9: Microsoft.AspNetCore.Components.WebView.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 16184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_10; uint8_t* data
	}, ; 10: Microsoft.AspNetCore.Metadata
	%struct.CompressedAssemblyDescriptor {
		i32 176696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_11; uint8_t* data
	}, ; 11: Microsoft.Data.Sqlite
	%struct.CompressedAssemblyDescriptor {
		i32 2692168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_12; uint8_t* data
	}, ; 12: Microsoft.EntityFrameworkCore
	%struct.CompressedAssemblyDescriptor {
		i32 34848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_13; uint8_t* data
	}, ; 13: Microsoft.EntityFrameworkCore.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 2143264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_14; uint8_t* data
	}, ; 14: Microsoft.EntityFrameworkCore.Relational
	%struct.CompressedAssemblyDescriptor {
		i32 296480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_15; uint8_t* data
	}, ; 15: Microsoft.EntityFrameworkCore.Sqlite
	%struct.CompressedAssemblyDescriptor {
		i32 36632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_16; uint8_t* data
	}, ; 16: Microsoft.Extensions.Caching.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 48912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_17; uint8_t* data
	}, ; 17: Microsoft.Extensions.Caching.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 45344, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_18; uint8_t* data
	}, ; 18: Microsoft.Extensions.Configuration
	%struct.CompressedAssemblyDescriptor {
		i32 29480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_19; uint8_t* data
	}, ; 19: Microsoft.Extensions.Configuration.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 44816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_20; uint8_t* data
	}, ; 20: Microsoft.Extensions.Configuration.Binder
	%struct.CompressedAssemblyDescriptor {
		i32 29480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_21; uint8_t* data
	}, ; 21: Microsoft.Extensions.Configuration.FileExtensions
	%struct.CompressedAssemblyDescriptor {
		i32 28424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_22; uint8_t* data
	}, ; 22: Microsoft.Extensions.Configuration.Json
	%struct.CompressedAssemblyDescriptor {
		i32 93472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_23; uint8_t* data
	}, ; 23: Microsoft.Extensions.DependencyInjection
	%struct.CompressedAssemblyDescriptor {
		i32 65824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_24; uint8_t* data
	}, ; 24: Microsoft.Extensions.DependencyInjection.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 85280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_25; uint8_t* data
	}, ; 25: Microsoft.Extensions.DependencyModel
	%struct.CompressedAssemblyDescriptor {
		i32 23864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_26; uint8_t* data
	}, ; 26: Microsoft.Extensions.FileProviders.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 19240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_27; uint8_t* data
	}, ; 27: Microsoft.Extensions.FileProviders.Composite
	%struct.CompressedAssemblyDescriptor {
		i32 34064, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_28; uint8_t* data
	}, ; 28: Microsoft.Extensions.FileProviders.Embedded
	%struct.CompressedAssemblyDescriptor {
		i32 46376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_29; uint8_t* data
	}, ; 29: Microsoft.Extensions.FileProviders.Physical
	%struct.CompressedAssemblyDescriptor {
		i32 46880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_30; uint8_t* data
	}, ; 30: Microsoft.Extensions.FileSystemGlobbing
	%struct.CompressedAssemblyDescriptor {
		i32 52488, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_31; uint8_t* data
	}, ; 31: Microsoft.Extensions.Logging
	%struct.CompressedAssemblyDescriptor {
		i32 67344, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_32; uint8_t* data
	}, ; 32: Microsoft.Extensions.Logging.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 20256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_33; uint8_t* data
	}, ; 33: Microsoft.Extensions.Logging.Debug
	%struct.CompressedAssemblyDescriptor {
		i32 66320, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_34; uint8_t* data
	}, ; 34: Microsoft.Extensions.Options
	%struct.CompressedAssemblyDescriptor {
		i32 45344, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_35; uint8_t* data
	}, ; 35: Microsoft.Extensions.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 65320, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_36; uint8_t* data
	}, ; 36: Microsoft.JSInterop
	%struct.CompressedAssemblyDescriptor {
		i32 1877816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_37; uint8_t* data
	}, ; 37: Microsoft.Maui.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 128264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_38; uint8_t* data
	}, ; 38: Microsoft.Maui.Controls.Xaml
	%struct.CompressedAssemblyDescriptor {
		i32 802608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_39; uint8_t* data
	}, ; 39: Microsoft.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 246576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_40; uint8_t* data
	}, ; 40: Microsoft.Maui.Essentials
	%struct.CompressedAssemblyDescriptor {
		i32 207640, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_41; uint8_t* data
	}, ; 41: Microsoft.Maui.Graphics
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_42; uint8_t* data
	}, ; 42: SQLitePCLRaw.batteries_v2
	%struct.CompressedAssemblyDescriptor {
		i32 51200, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_43; uint8_t* data
	}, ; 43: SQLitePCLRaw.core
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_44; uint8_t* data
	}, ; 44: SQLitePCLRaw.lib.e_sqlite3.android
	%struct.CompressedAssemblyDescriptor {
		i32 36864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_45; uint8_t* data
	}, ; 45: SQLitePCLRaw.provider.e_sqlite3
	%struct.CompressedAssemblyDescriptor {
		i32 1127496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_46; uint8_t* data
	}, ; 46: Xamarin.Android.Glide
	%struct.CompressedAssemblyDescriptor {
		i32 15944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_47; uint8_t* data
	}, ; 47: Xamarin.Android.Glide.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 25648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_48; uint8_t* data
	}, ; 48: Xamarin.Android.Glide.DiskLruCache
	%struct.CompressedAssemblyDescriptor {
		i32 59976, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_49; uint8_t* data
	}, ; 49: Xamarin.Android.Glide.GifDecoder
	%struct.CompressedAssemblyDescriptor {
		i32 198704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_50; uint8_t* data
	}, ; 50: Xamarin.AndroidX.Activity
	%struct.CompressedAssemblyDescriptor {
		i32 15920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_51; uint8_t* data
	}, ; 51: Xamarin.AndroidX.Activity.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 15912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_52; uint8_t* data
	}, ; 52: Xamarin.AndroidX.Annotation
	%struct.CompressedAssemblyDescriptor {
		i32 35376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_53; uint8_t* data
	}, ; 53: Xamarin.AndroidX.Annotation.Experimental
	%struct.CompressedAssemblyDescriptor {
		i32 197704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_54; uint8_t* data
	}, ; 54: Xamarin.AndroidX.Annotation.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 1140736, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_55; uint8_t* data
	}, ; 55: Xamarin.AndroidX.AppCompat
	%struct.CompressedAssemblyDescriptor {
		i32 95792, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_56; uint8_t* data
	}, ; 56: Xamarin.AndroidX.AppCompat.AppCompatResources
	%struct.CompressedAssemblyDescriptor {
		i32 36400, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_57; uint8_t* data
	}, ; 57: Xamarin.AndroidX.Arch.Core.Common
	%struct.CompressedAssemblyDescriptor {
		i32 27184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_58; uint8_t* data
	}, ; 58: Xamarin.AndroidX.Arch.Core.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 392776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_59; uint8_t* data
	}, ; 59: Xamarin.AndroidX.Browser
	%struct.CompressedAssemblyDescriptor {
		i32 32816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_60; uint8_t* data
	}, ; 60: Xamarin.AndroidX.CardView
	%struct.CompressedAssemblyDescriptor {
		i32 15912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_61; uint8_t* data
	}, ; 61: Xamarin.AndroidX.Collection
	%struct.CompressedAssemblyDescriptor {
		i32 623664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_62; uint8_t* data
	}, ; 62: Xamarin.AndroidX.Collection.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 15944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_63; uint8_t* data
	}, ; 63: Xamarin.AndroidX.Collection.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 35888, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_64; uint8_t* data
	}, ; 64: Xamarin.AndroidX.Concurrent.Futures
	%struct.CompressedAssemblyDescriptor {
		i32 672840, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_65; uint8_t* data
	}, ; 65: Xamarin.AndroidX.ConstraintLayout
	%struct.CompressedAssemblyDescriptor {
		i32 1311792, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_66; uint8_t* data
	}, ; 66: Xamarin.AndroidX.ConstraintLayout.Core
	%struct.CompressedAssemblyDescriptor {
		i32 106024, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_67; uint8_t* data
	}, ; 67: Xamarin.AndroidX.CoordinatorLayout
	%struct.CompressedAssemblyDescriptor {
		i32 2094080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_68; uint8_t* data
	}, ; 68: Xamarin.AndroidX.Core
	%struct.CompressedAssemblyDescriptor {
		i32 216624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_69; uint8_t* data
	}, ; 69: Xamarin.AndroidX.Core.Core.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 20016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_70; uint8_t* data
	}, ; 70: Xamarin.AndroidX.Core.ViewTree
	%struct.CompressedAssemblyDescriptor {
		i32 60464, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_71; uint8_t* data
	}, ; 71: Xamarin.AndroidX.CursorAdapter
	%struct.CompressedAssemblyDescriptor {
		i32 67112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_72; uint8_t* data
	}, ; 72: Xamarin.AndroidX.CustomView
	%struct.CompressedAssemblyDescriptor {
		i32 25648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_73; uint8_t* data
	}, ; 73: Xamarin.AndroidX.CustomView.PoolingContainer
	%struct.CompressedAssemblyDescriptor {
		i32 63536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_74; uint8_t* data
	}, ; 74: Xamarin.AndroidX.DrawerLayout
	%struct.CompressedAssemblyDescriptor {
		i32 70704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_75; uint8_t* data
	}, ; 75: Xamarin.AndroidX.DynamicAnimation
	%struct.CompressedAssemblyDescriptor {
		i32 263240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_76; uint8_t* data
	}, ; 76: Xamarin.AndroidX.Emoji2
	%struct.CompressedAssemblyDescriptor {
		i32 26160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_77; uint8_t* data
	}, ; 77: Xamarin.AndroidX.Emoji2.ViewsHelper
	%struct.CompressedAssemblyDescriptor {
		i32 69192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_78; uint8_t* data
	}, ; 78: Xamarin.AndroidX.ExifInterface
	%struct.CompressedAssemblyDescriptor {
		i32 340008, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_79; uint8_t* data
	}, ; 79: Xamarin.AndroidX.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 27184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_80; uint8_t* data
	}, ; 80: Xamarin.AndroidX.Fragment.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 25136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_81; uint8_t* data
	}, ; 81: Xamarin.AndroidX.Interpolator
	%struct.CompressedAssemblyDescriptor {
		i32 16944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_82; uint8_t* data
	}, ; 82: Xamarin.AndroidX.Lifecycle.Common
	%struct.CompressedAssemblyDescriptor {
		i32 70184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_83; uint8_t* data
	}, ; 83: Xamarin.AndroidX.Lifecycle.Common.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 38960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_84; uint8_t* data
	}, ; 84: Xamarin.AndroidX.Lifecycle.LiveData
	%struct.CompressedAssemblyDescriptor {
		i32 34864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_85; uint8_t* data
	}, ; 85: Xamarin.AndroidX.Lifecycle.LiveData.Core
	%struct.CompressedAssemblyDescriptor {
		i32 16456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_86; uint8_t* data
	}, ; 86: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 22576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_87; uint8_t* data
	}, ; 87: Xamarin.AndroidX.Lifecycle.Process
	%struct.CompressedAssemblyDescriptor {
		i32 15400, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_88; uint8_t* data
	}, ; 88: Xamarin.AndroidX.Lifecycle.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 53320, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_89; uint8_t* data
	}, ; 89: Xamarin.AndroidX.Lifecycle.Runtime.Android
	%struct.CompressedAssemblyDescriptor {
		i32 15920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_90; uint8_t* data
	}, ; 90: Xamarin.AndroidX.Lifecycle.Runtime.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 16432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_91; uint8_t* data
	}, ; 91: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android
	%struct.CompressedAssemblyDescriptor {
		i32 16968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_92; uint8_t* data
	}, ; 92: Xamarin.AndroidX.Lifecycle.ViewModel
	%struct.CompressedAssemblyDescriptor {
		i32 82984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_93; uint8_t* data
	}, ; 93: Xamarin.AndroidX.Lifecycle.ViewModel.Android
	%struct.CompressedAssemblyDescriptor {
		i32 16432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_94; uint8_t* data
	}, ; 94: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 40496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_95; uint8_t* data
	}, ; 95: Xamarin.AndroidX.Lifecycle.ViewModelSavedState
	%struct.CompressedAssemblyDescriptor {
		i32 65584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_96; uint8_t* data
	}, ; 96: Xamarin.AndroidX.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 216648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_97; uint8_t* data
	}, ; 97: Xamarin.AndroidX.Navigation.Common
	%struct.CompressedAssemblyDescriptor {
		i32 59440, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_98; uint8_t* data
	}, ; 98: Xamarin.AndroidX.Navigation.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 116784, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_99; uint8_t* data
	}, ; 99: Xamarin.AndroidX.Navigation.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 57392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_100; uint8_t* data
	}, ; 100: Xamarin.AndroidX.Navigation.UI
	%struct.CompressedAssemblyDescriptor {
		i32 50224, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_101; uint8_t* data
	}, ; 101: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller
	%struct.CompressedAssemblyDescriptor {
		i32 606792, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_102; uint8_t* data
	}, ; 102: Xamarin.AndroidX.RecyclerView
	%struct.CompressedAssemblyDescriptor {
		i32 29256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_103; uint8_t* data
	}, ; 103: Xamarin.AndroidX.ResourceInspection.Annotation
	%struct.CompressedAssemblyDescriptor {
		i32 34352, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_104; uint8_t* data
	}, ; 104: Xamarin.AndroidX.SavedState
	%struct.CompressedAssemblyDescriptor {
		i32 18992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_105; uint8_t* data
	}, ; 105: Xamarin.AndroidX.SavedState.SavedState.Ktx
	%struct.CompressedAssemblyDescriptor {
		i32 46664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_106; uint8_t* data
	}, ; 106: Xamarin.AndroidX.Security.SecurityCrypto
	%struct.CompressedAssemblyDescriptor {
		i32 47664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_107; uint8_t* data
	}, ; 107: Xamarin.AndroidX.SlidingPaneLayout
	%struct.CompressedAssemblyDescriptor {
		i32 31280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_108; uint8_t* data
	}, ; 108: Xamarin.AndroidX.Startup.StartupRuntime
	%struct.CompressedAssemblyDescriptor {
		i32 70696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_109; uint8_t* data
	}, ; 109: Xamarin.AndroidX.SwipeRefreshLayout
	%struct.CompressedAssemblyDescriptor {
		i32 20016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_110; uint8_t* data
	}, ; 110: Xamarin.AndroidX.Tracing.Tracing
	%struct.CompressedAssemblyDescriptor {
		i32 158208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_111; uint8_t* data
	}, ; 111: Xamarin.AndroidX.Transition
	%struct.CompressedAssemblyDescriptor {
		i32 33832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_112; uint8_t* data
	}, ; 112: Xamarin.AndroidX.VectorDrawable
	%struct.CompressedAssemblyDescriptor {
		i32 47664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_113; uint8_t* data
	}, ; 113: Xamarin.AndroidX.VectorDrawable.Animated
	%struct.CompressedAssemblyDescriptor {
		i32 110120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_114; uint8_t* data
	}, ; 114: Xamarin.AndroidX.VersionedParcelable
	%struct.CompressedAssemblyDescriptor {
		i32 89136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_115; uint8_t* data
	}, ; 115: Xamarin.AndroidX.ViewPager
	%struct.CompressedAssemblyDescriptor {
		i32 72232, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_116; uint8_t* data
	}, ; 116: Xamarin.AndroidX.ViewPager2
	%struct.CompressedAssemblyDescriptor {
		i32 200776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_117; uint8_t* data
	}, ; 117: Xamarin.AndroidX.Window
	%struct.CompressedAssemblyDescriptor {
		i32 25136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_118; uint8_t* data
	}, ; 118: Xamarin.AndroidX.Window.Extensions.Core.Core
	%struct.CompressedAssemblyDescriptor {
		i32 2500608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_119; uint8_t* data
	}, ; 119: Xamarin.Google.Android.Material
	%struct.CompressedAssemblyDescriptor {
		i32 95272, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_120; uint8_t* data
	}, ; 120: Jsr305Binding
	%struct.CompressedAssemblyDescriptor {
		i32 5734984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_121; uint8_t* data
	}, ; 121: Xamarin.Google.Crypto.Tink.Android
	%struct.CompressedAssemblyDescriptor {
		i32 95280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_122; uint8_t* data
	}, ; 122: Xamarin.Google.ErrorProne.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 15920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_123; uint8_t* data
	}, ; 123: Xamarin.Google.ErrorProne.TypeAnnotations
	%struct.CompressedAssemblyDescriptor {
		i32 26672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_124; uint8_t* data
	}, ; 124: Xamarin.Google.Guava.ListenableFuture
	%struct.CompressedAssemblyDescriptor {
		i32 153672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_125; uint8_t* data
	}, ; 125: Xamarin.Jetbrains.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 27208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_126; uint8_t* data
	}, ; 126: Xamarin.JSpecify
	%struct.CompressedAssemblyDescriptor {
		i32 2298440, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_127; uint8_t* data
	}, ; 127: Xamarin.Kotlin.StdLib
	%struct.CompressedAssemblyDescriptor {
		i32 15944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_128; uint8_t* data
	}, ; 128: Xamarin.KotlinX.AtomicFU
	%struct.CompressedAssemblyDescriptor {
		i32 54320, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_129; uint8_t* data
	}, ; 129: Xamarin.KotlinX.AtomicFU.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 27720, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_130; uint8_t* data
	}, ; 130: Xamarin.KotlinX.Coroutines.Android
	%struct.CompressedAssemblyDescriptor {
		i32 16456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_131; uint8_t* data
	}, ; 131: Xamarin.KotlinX.Coroutines.Core
	%struct.CompressedAssemblyDescriptor {
		i32 546888, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_132; uint8_t* data
	}, ; 132: Xamarin.KotlinX.Coroutines.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 16424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_133; uint8_t* data
	}, ; 133: Xamarin.KotlinX.Serialization.Core
	%struct.CompressedAssemblyDescriptor {
		i32 311880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_134; uint8_t* data
	}, ; 134: Xamarin.KotlinX.Serialization.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 15664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_135; uint8_t* data
	}, ; 135: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_136; uint8_t* data
	}, ; 136: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_137; uint8_t* data
	}, ; 137: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_138; uint8_t* data
	}, ; 138: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_139; uint8_t* data
	}, ; 139: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_140; uint8_t* data
	}, ; 140: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_141; uint8_t* data
	}, ; 141: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_142; uint8_t* data
	}, ; 142: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_143; uint8_t* data
	}, ; 143: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_144; uint8_t* data
	}, ; 144: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_145; uint8_t* data
	}, ; 145: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_146; uint8_t* data
	}, ; 146: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_147; uint8_t* data
	}, ; 147: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_148; uint8_t* data
	}, ; 148: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_149; uint8_t* data
	}, ; 149: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_150; uint8_t* data
	}, ; 150: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_151; uint8_t* data
	}, ; 151: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_152; uint8_t* data
	}, ; 152: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_153; uint8_t* data
	}, ; 153: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_154; uint8_t* data
	}, ; 154: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_155; uint8_t* data
	}, ; 155: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_156; uint8_t* data
	}, ; 156: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_157; uint8_t* data
	}, ; 157: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_158; uint8_t* data
	}, ; 158: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_159; uint8_t* data
	}, ; 159: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_160; uint8_t* data
	}, ; 160: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_161; uint8_t* data
	}, ; 161: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_162; uint8_t* data
	}, ; 162: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_163; uint8_t* data
	}, ; 163: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_164; uint8_t* data
	}, ; 164: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_165; uint8_t* data
	}, ; 165: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_166; uint8_t* data
	}, ; 166: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15640, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_167; uint8_t* data
	}, ; 167: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_168; uint8_t* data
	}, ; 168: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 717824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_169; uint8_t* data
	}, ; 169: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 307536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_170; uint8_t* data
	}, ; 170: Microsoft.CSharp
	%struct.CompressedAssemblyDescriptor {
		i32 429864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_171; uint8_t* data
	}, ; 171: Microsoft.VisualBasic.Core
	%struct.CompressedAssemblyDescriptor {
		i32 17192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_172; uint8_t* data
	}, ; 172: Microsoft.VisualBasic
	%struct.CompressedAssemblyDescriptor {
		i32 15184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_173; uint8_t* data
	}, ; 173: Microsoft.Win32.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 33064, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_174; uint8_t* data
	}, ; 174: Microsoft.Win32.Registry
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_175; uint8_t* data
	}, ; 175: System.AppContext
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_176; uint8_t* data
	}, ; 176: System.Buffers
	%struct.CompressedAssemblyDescriptor {
		i32 89384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_177; uint8_t* data
	}, ; 177: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 255272, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_178; uint8_t* data
	}, ; 178: System.Collections.Immutable
	%struct.CompressedAssemblyDescriptor {
		i32 47912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_179; uint8_t* data
	}, ; 179: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 47952, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_180; uint8_t* data
	}, ; 180: System.Collections.Specialized
	%struct.CompressedAssemblyDescriptor {
		i32 126248, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_181; uint8_t* data
	}, ; 181: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 102184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_182; uint8_t* data
	}, ; 182: System.ComponentModel.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 16720, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_183; uint8_t* data
	}, ; 183: System.ComponentModel.DataAnnotations
	%struct.CompressedAssemblyDescriptor {
		i32 26448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_184; uint8_t* data
	}, ; 184: System.ComponentModel.EventBasedAsync
	%struct.CompressedAssemblyDescriptor {
		i32 41768, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_185; uint8_t* data
	}, ; 185: System.ComponentModel.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 315176, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_186; uint8_t* data
	}, ; 186: System.ComponentModel.TypeConverter
	%struct.CompressedAssemblyDescriptor {
		i32 16168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_187; uint8_t* data
	}, ; 187: System.ComponentModel
	%struct.CompressedAssemblyDescriptor {
		i32 19280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_188; uint8_t* data
	}, ; 188: System.Configuration
	%struct.CompressedAssemblyDescriptor {
		i32 50512, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_189; uint8_t* data
	}, ; 189: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 23336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_190; uint8_t* data
	}, ; 190: System.Core
	%struct.CompressedAssemblyDescriptor {
		i32 1016104, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_191; uint8_t* data
	}, ; 191: System.Data.Common
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_192; uint8_t* data
	}, ; 192: System.Data.DataSetExtensions
	%struct.CompressedAssemblyDescriptor {
		i32 24872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_193; uint8_t* data
	}, ; 193: System.Data
	%struct.CompressedAssemblyDescriptor {
		i32 16168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_194; uint8_t* data
	}, ; 194: System.Diagnostics.Contracts
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_195; uint8_t* data
	}, ; 195: System.Diagnostics.Debug
	%struct.CompressedAssemblyDescriptor {
		i32 184144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_196; uint8_t* data
	}, ; 196: System.Diagnostics.DiagnosticSource
	%struct.CompressedAssemblyDescriptor {
		i32 28968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_197; uint8_t* data
	}, ; 197: System.Diagnostics.FileVersionInfo
	%struct.CompressedAssemblyDescriptor {
		i32 126800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_198; uint8_t* data
	}, ; 198: System.Diagnostics.Process
	%struct.CompressedAssemblyDescriptor {
		i32 25936, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_199; uint8_t* data
	}, ; 199: System.Diagnostics.StackTrace
	%struct.CompressedAssemblyDescriptor {
		i32 31568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_200; uint8_t* data
	}, ; 200: System.Diagnostics.TextWriterTraceListener
	%struct.CompressedAssemblyDescriptor {
		i32 15184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_201; uint8_t* data
	}, ; 201: System.Diagnostics.Tools
	%struct.CompressedAssemblyDescriptor {
		i32 58704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_202; uint8_t* data
	}, ; 202: System.Diagnostics.TraceSource
	%struct.CompressedAssemblyDescriptor {
		i32 16208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_203; uint8_t* data
	}, ; 203: System.Diagnostics.Tracing
	%struct.CompressedAssemblyDescriptor {
		i32 64296, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_204; uint8_t* data
	}, ; 204: System.Drawing.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 20304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_205; uint8_t* data
	}, ; 205: System.Drawing
	%struct.CompressedAssemblyDescriptor {
		i32 16208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_206; uint8_t* data
	}, ; 206: System.Dynamic.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 96040, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_207; uint8_t* data
	}, ; 207: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 121128, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_208; uint8_t* data
	}, ; 208: System.Formats.Tar
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_209; uint8_t* data
	}, ; 209: System.Globalization.Calendars
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_210; uint8_t* data
	}, ; 210: System.Globalization.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_211; uint8_t* data
	}, ; 211: System.Globalization
	%struct.CompressedAssemblyDescriptor {
		i32 40744, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_212; uint8_t* data
	}, ; 212: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 15184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_213; uint8_t* data
	}, ; 213: System.IO.Compression.FileSystem
	%struct.CompressedAssemblyDescriptor {
		i32 37672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_214; uint8_t* data
	}, ; 214: System.IO.Compression.ZipFile
	%struct.CompressedAssemblyDescriptor {
		i32 109864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_215; uint8_t* data
	}, ; 215: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 32040, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_216; uint8_t* data
	}, ; 216: System.IO.FileSystem.AccessControl
	%struct.CompressedAssemblyDescriptor {
		i32 47952, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_217; uint8_t* data
	}, ; 217: System.IO.FileSystem.DriveInfo
	%struct.CompressedAssemblyDescriptor {
		i32 15184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_218; uint8_t* data
	}, ; 218: System.IO.FileSystem.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 54608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_219; uint8_t* data
	}, ; 219: System.IO.FileSystem.Watcher
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_220; uint8_t* data
	}, ; 220: System.IO.FileSystem
	%struct.CompressedAssemblyDescriptor {
		i32 43304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_221; uint8_t* data
	}, ; 221: System.IO.IsolatedStorage
	%struct.CompressedAssemblyDescriptor {
		i32 48424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_222; uint8_t* data
	}, ; 222: System.IO.MemoryMappedFiles
	%struct.CompressedAssemblyDescriptor {
		i32 78120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_223; uint8_t* data
	}, ; 223: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 23376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_224; uint8_t* data
	}, ; 224: System.IO.Pipes.AccessControl
	%struct.CompressedAssemblyDescriptor {
		i32 67368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_225; uint8_t* data
	}, ; 225: System.IO.Pipes
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_226; uint8_t* data
	}, ; 226: System.IO.UnmanagedMemoryStream
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_227; uint8_t* data
	}, ; 227: System.IO
	%struct.CompressedAssemblyDescriptor {
		i32 575272, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_228; uint8_t* data
	}, ; 228: System.Linq.Expressions
	%struct.CompressedAssemblyDescriptor {
		i32 223056, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_229; uint8_t* data
	}, ; 229: System.Linq.Parallel
	%struct.CompressedAssemblyDescriptor {
		i32 76072, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_230; uint8_t* data
	}, ; 230: System.Linq.Queryable
	%struct.CompressedAssemblyDescriptor {
		i32 148776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_231; uint8_t* data
	}, ; 231: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 55592, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_232; uint8_t* data
	}, ; 232: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 56144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_233; uint8_t* data
	}, ; 233: System.Net.Http.Json
	%struct.CompressedAssemblyDescriptor {
		i32 676136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_234; uint8_t* data
	}, ; 234: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 131368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_235; uint8_t* data
	}, ; 235: System.Net.HttpListener
	%struct.CompressedAssemblyDescriptor {
		i32 174376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_236; uint8_t* data
	}, ; 236: System.Net.Mail
	%struct.CompressedAssemblyDescriptor {
		i32 51536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_237; uint8_t* data
	}, ; 237: System.Net.NameResolution
	%struct.CompressedAssemblyDescriptor {
		i32 65832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_238; uint8_t* data
	}, ; 238: System.Net.NetworkInformation
	%struct.CompressedAssemblyDescriptor {
		i32 55592, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_239; uint8_t* data
	}, ; 239: System.Net.Ping
	%struct.CompressedAssemblyDescriptor {
		i32 106832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_240; uint8_t* data
	}, ; 240: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 172880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_241; uint8_t* data
	}, ; 241: System.Net.Quic
	%struct.CompressedAssemblyDescriptor {
		i32 161616, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_242; uint8_t* data
	}, ; 242: System.Net.Requests
	%struct.CompressedAssemblyDescriptor {
		i32 253224, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_243; uint8_t* data
	}, ; 243: System.Net.Security
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_244; uint8_t* data
	}, ; 244: System.Net.ServicePoint
	%struct.CompressedAssemblyDescriptor {
		i32 234832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_245; uint8_t* data
	}, ; 245: System.Net.Sockets
	%struct.CompressedAssemblyDescriptor {
		i32 70440, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_246; uint8_t* data
	}, ; 246: System.Net.WebClient
	%struct.CompressedAssemblyDescriptor {
		i32 33104, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_247; uint8_t* data
	}, ; 247: System.Net.WebHeaderCollection
	%struct.CompressedAssemblyDescriptor {
		i32 23376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_248; uint8_t* data
	}, ; 248: System.Net.WebProxy
	%struct.CompressedAssemblyDescriptor {
		i32 51536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_249; uint8_t* data
	}, ; 249: System.Net.WebSockets.Client
	%struct.CompressedAssemblyDescriptor {
		i32 103248, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_250; uint8_t* data
	}, ; 250: System.Net.WebSockets
	%struct.CompressedAssemblyDescriptor {
		i32 17232, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_251; uint8_t* data
	}, ; 251: System.Net
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_252; uint8_t* data
	}, ; 252: System.Numerics.Vectors
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_253; uint8_t* data
	}, ; 253: System.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 41256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_254; uint8_t* data
	}, ; 254: System.ObjectModel
	%struct.CompressedAssemblyDescriptor {
		i32 851792, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_255; uint8_t* data
	}, ; 255: System.Private.DataContractSerialization
	%struct.CompressedAssemblyDescriptor {
		i32 102696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_256; uint8_t* data
	}, ; 256: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 153384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_257; uint8_t* data
	}, ; 257: System.Private.Xml.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 3099432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_258; uint8_t* data
	}, ; 258: System.Private.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 38184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_259; uint8_t* data
	}, ; 259: System.Reflection.DispatchProxy
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_260; uint8_t* data
	}, ; 260: System.Reflection.Emit.ILGeneration
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_261; uint8_t* data
	}, ; 261: System.Reflection.Emit.Lightweight
	%struct.CompressedAssemblyDescriptor {
		i32 129832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_262; uint8_t* data
	}, ; 262: System.Reflection.Emit
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_263; uint8_t* data
	}, ; 263: System.Reflection.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 501032, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_264; uint8_t* data
	}, ; 264: System.Reflection.Metadata
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_265; uint8_t* data
	}, ; 265: System.Reflection.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 23888, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_266; uint8_t* data
	}, ; 266: System.Reflection.TypeExtensions
	%struct.CompressedAssemblyDescriptor {
		i32 16168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_267; uint8_t* data
	}, ; 267: System.Reflection
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_268; uint8_t* data
	}, ; 268: System.Resources.Reader
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_269; uint8_t* data
	}, ; 269: System.Resources.ResourceManager
	%struct.CompressedAssemblyDescriptor {
		i32 26408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_270; uint8_t* data
	}, ; 270: System.Resources.Writer
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_271; uint8_t* data
	}, ; 271: System.Runtime.CompilerServices.Unsafe
	%struct.CompressedAssemblyDescriptor {
		i32 17192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_272; uint8_t* data
	}, ; 272: System.Runtime.CompilerServices.VisualC
	%struct.CompressedAssemblyDescriptor {
		i32 17704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_273; uint8_t* data
	}, ; 273: System.Runtime.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_274; uint8_t* data
	}, ; 274: System.Runtime.Handles
	%struct.CompressedAssemblyDescriptor {
		i32 38184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_275; uint8_t* data
	}, ; 275: System.Runtime.InteropServices.JavaScript
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_276; uint8_t* data
	}, ; 276: System.Runtime.InteropServices.RuntimeInformation
	%struct.CompressedAssemblyDescriptor {
		i32 64336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_277; uint8_t* data
	}, ; 277: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 17192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_278; uint8_t* data
	}, ; 278: System.Runtime.Intrinsics
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_279; uint8_t* data
	}, ; 279: System.Runtime.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 143144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_280; uint8_t* data
	}, ; 280: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 65832, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_281; uint8_t* data
	}, ; 281: System.Runtime.Serialization.Formatters
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_282; uint8_t* data
	}, ; 282: System.Runtime.Serialization.Json
	%struct.CompressedAssemblyDescriptor {
		i32 23376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_283; uint8_t* data
	}, ; 283: System.Runtime.Serialization.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 16680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_284; uint8_t* data
	}, ; 284: System.Runtime.Serialization.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 16680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_285; uint8_t* data
	}, ; 285: System.Runtime.Serialization
	%struct.CompressedAssemblyDescriptor {
		i32 44328, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_286; uint8_t* data
	}, ; 286: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 58192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_287; uint8_t* data
	}, ; 287: System.Security.AccessControl
	%struct.CompressedAssemblyDescriptor {
		i32 53544, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_288; uint8_t* data
	}, ; 288: System.Security.Claims
	%struct.CompressedAssemblyDescriptor {
		i32 17192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_289; uint8_t* data
	}, ; 289: System.Security.Cryptography.Algorithms
	%struct.CompressedAssemblyDescriptor {
		i32 16168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_290; uint8_t* data
	}, ; 290: System.Security.Cryptography.Cng
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_291; uint8_t* data
	}, ; 291: System.Security.Cryptography.Csp
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_292; uint8_t* data
	}, ; 292: System.Security.Cryptography.Encoding
	%struct.CompressedAssemblyDescriptor {
		i32 15184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_293; uint8_t* data
	}, ; 293: System.Security.Cryptography.OpenSsl
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_294; uint8_t* data
	}, ; 294: System.Security.Cryptography.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 16680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_295; uint8_t* data
	}, ; 295: System.Security.Cryptography.X509Certificates
	%struct.CompressedAssemblyDescriptor {
		i32 704808, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_296; uint8_t* data
	}, ; 296: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 37672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_297; uint8_t* data
	}, ; 297: System.Security.Principal.Windows
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_298; uint8_t* data
	}, ; 298: System.Security.Principal
	%struct.CompressedAssemblyDescriptor {
		i32 15184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_299; uint8_t* data
	}, ; 299: System.Security.SecureString
	%struct.CompressedAssemblyDescriptor {
		i32 18216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_300; uint8_t* data
	}, ; 300: System.Security
	%struct.CompressedAssemblyDescriptor {
		i32 16680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_301; uint8_t* data
	}, ; 301: System.ServiceModel.Web
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_302; uint8_t* data
	}, ; 302: System.ServiceProcess
	%struct.CompressedAssemblyDescriptor {
		i32 740648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_303; uint8_t* data
	}, ; 303: System.Text.Encoding.CodePages
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_304; uint8_t* data
	}, ; 304: System.Text.Encoding.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_305; uint8_t* data
	}, ; 305: System.Text.Encoding
	%struct.CompressedAssemblyDescriptor {
		i32 69968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_306; uint8_t* data
	}, ; 306: System.Text.Encodings.Web
	%struct.CompressedAssemblyDescriptor {
		i32 617256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_307; uint8_t* data
	}, ; 307: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 368976, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_308; uint8_t* data
	}, ; 308: System.Text.RegularExpressions
	%struct.CompressedAssemblyDescriptor {
		i32 56656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_309; uint8_t* data
	}, ; 309: System.Threading.Channels
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_310; uint8_t* data
	}, ; 310: System.Threading.Overlapped
	%struct.CompressedAssemblyDescriptor {
		i32 185680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_311; uint8_t* data
	}, ; 311: System.Threading.Tasks.Dataflow
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_312; uint8_t* data
	}, ; 312: System.Threading.Tasks.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 61224, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_313; uint8_t* data
	}, ; 313: System.Threading.Tasks.Parallel
	%struct.CompressedAssemblyDescriptor {
		i32 16680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_314; uint8_t* data
	}, ; 314: System.Threading.Tasks
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_315; uint8_t* data
	}, ; 315: System.Threading.Thread
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_316; uint8_t* data
	}, ; 316: System.Threading.ThreadPool
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_317; uint8_t* data
	}, ; 317: System.Threading.Timer
	%struct.CompressedAssemblyDescriptor {
		i32 44880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_318; uint8_t* data
	}, ; 318: System.Threading
	%struct.CompressedAssemblyDescriptor {
		i32 175400, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_319; uint8_t* data
	}, ; 319: System.Transactions.Local
	%struct.CompressedAssemblyDescriptor {
		i32 16168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_320; uint8_t* data
	}, ; 320: System.Transactions
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_321; uint8_t* data
	}, ; 321: System.ValueTuple
	%struct.CompressedAssemblyDescriptor {
		i32 30504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_322; uint8_t* data
	}, ; 322: System.Web.HttpUtility
	%struct.CompressedAssemblyDescriptor {
		i32 15144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_323; uint8_t* data
	}, ; 323: System.Web
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_324; uint8_t* data
	}, ; 324: System.Windows
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_325; uint8_t* data
	}, ; 325: System.Xml.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 21840, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_326; uint8_t* data
	}, ; 326: System.Xml.ReaderWriter
	%struct.CompressedAssemblyDescriptor {
		i32 16168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_327; uint8_t* data
	}, ; 327: System.Xml.Serialization
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_328; uint8_t* data
	}, ; 328: System.Xml.XDocument
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_329; uint8_t* data
	}, ; 329: System.Xml.XPath.XDocument
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_330; uint8_t* data
	}, ; 330: System.Xml.XPath
	%struct.CompressedAssemblyDescriptor {
		i32 15696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_331; uint8_t* data
	}, ; 331: System.Xml.XmlDocument
	%struct.CompressedAssemblyDescriptor {
		i32 17704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_332; uint8_t* data
	}, ; 332: System.Xml.XmlSerializer
	%struct.CompressedAssemblyDescriptor {
		i32 23336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_333; uint8_t* data
	}, ; 333: System.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 50472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_334; uint8_t* data
	}, ; 334: System
	%struct.CompressedAssemblyDescriptor {
		i32 16168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_335; uint8_t* data
	}, ; 335: WindowsBase
	%struct.CompressedAssemblyDescriptor {
		i32 59688, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_336; uint8_t* data
	}, ; 336: mscorlib
	%struct.CompressedAssemblyDescriptor {
		i32 100648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_337; uint8_t* data
	}, ; 337: netstandard
	%struct.CompressedAssemblyDescriptor {
		i32 240200, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_338; uint8_t* data
	}, ; 338: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 82968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_339; uint8_t* data
	}, ; 339: Mono.Android.Export
	%struct.CompressedAssemblyDescriptor {
		i32 19528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_340; uint8_t* data
	}, ; 340: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 37450312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_341; uint8_t* data
	}, ; 341: Mono.Android
	%struct.CompressedAssemblyDescriptor {
		i32 4776784, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_342; uint8_t* data
	} ; 342: System.Private.CoreLib
], align 16

@__compressedAssemblyData_0 = internal dso_local global [308736 x i8] zeroinitializer, align 16
@__compressedAssemblyData_1 = internal dso_local global [401704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_2 = internal dso_local global [166184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_3 = internal dso_local global [164912 x i8] zeroinitializer, align 16
@__compressedAssemblyData_4 = internal dso_local global [51504 x i8] zeroinitializer, align 16
@__compressedAssemblyData_5 = internal dso_local global [342312 x i8] zeroinitializer, align 16
@__compressedAssemblyData_6 = internal dso_local global [45856 x i8] zeroinitializer, align 16
@__compressedAssemblyData_7 = internal dso_local global [188176 x i8] zeroinitializer, align 16
@__compressedAssemblyData_8 = internal dso_local global [162080 x i8] zeroinitializer, align 16
@__compressedAssemblyData_9 = internal dso_local global [71480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_10 = internal dso_local global [16184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_11 = internal dso_local global [176696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_12 = internal dso_local global [2692168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_13 = internal dso_local global [34848 x i8] zeroinitializer, align 16
@__compressedAssemblyData_14 = internal dso_local global [2143264 x i8] zeroinitializer, align 16
@__compressedAssemblyData_15 = internal dso_local global [296480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_16 = internal dso_local global [36632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_17 = internal dso_local global [48912 x i8] zeroinitializer, align 16
@__compressedAssemblyData_18 = internal dso_local global [45344 x i8] zeroinitializer, align 16
@__compressedAssemblyData_19 = internal dso_local global [29480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_20 = internal dso_local global [44816 x i8] zeroinitializer, align 16
@__compressedAssemblyData_21 = internal dso_local global [29480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_22 = internal dso_local global [28424 x i8] zeroinitializer, align 16
@__compressedAssemblyData_23 = internal dso_local global [93472 x i8] zeroinitializer, align 16
@__compressedAssemblyData_24 = internal dso_local global [65824 x i8] zeroinitializer, align 16
@__compressedAssemblyData_25 = internal dso_local global [85280 x i8] zeroinitializer, align 16
@__compressedAssemblyData_26 = internal dso_local global [23864 x i8] zeroinitializer, align 16
@__compressedAssemblyData_27 = internal dso_local global [19240 x i8] zeroinitializer, align 16
@__compressedAssemblyData_28 = internal dso_local global [34064 x i8] zeroinitializer, align 16
@__compressedAssemblyData_29 = internal dso_local global [46376 x i8] zeroinitializer, align 16
@__compressedAssemblyData_30 = internal dso_local global [46880 x i8] zeroinitializer, align 16
@__compressedAssemblyData_31 = internal dso_local global [52488 x i8] zeroinitializer, align 16
@__compressedAssemblyData_32 = internal dso_local global [67344 x i8] zeroinitializer, align 16
@__compressedAssemblyData_33 = internal dso_local global [20256 x i8] zeroinitializer, align 16
@__compressedAssemblyData_34 = internal dso_local global [66320 x i8] zeroinitializer, align 16
@__compressedAssemblyData_35 = internal dso_local global [45344 x i8] zeroinitializer, align 16
@__compressedAssemblyData_36 = internal dso_local global [65320 x i8] zeroinitializer, align 16
@__compressedAssemblyData_37 = internal dso_local global [1877816 x i8] zeroinitializer, align 16
@__compressedAssemblyData_38 = internal dso_local global [128264 x i8] zeroinitializer, align 16
@__compressedAssemblyData_39 = internal dso_local global [802608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_40 = internal dso_local global [246576 x i8] zeroinitializer, align 16
@__compressedAssemblyData_41 = internal dso_local global [207640 x i8] zeroinitializer, align 16
@__compressedAssemblyData_42 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_43 = internal dso_local global [51200 x i8] zeroinitializer, align 16
@__compressedAssemblyData_44 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_45 = internal dso_local global [36864 x i8] zeroinitializer, align 16
@__compressedAssemblyData_46 = internal dso_local global [1127496 x i8] zeroinitializer, align 16
@__compressedAssemblyData_47 = internal dso_local global [15944 x i8] zeroinitializer, align 16
@__compressedAssemblyData_48 = internal dso_local global [25648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_49 = internal dso_local global [59976 x i8] zeroinitializer, align 16
@__compressedAssemblyData_50 = internal dso_local global [198704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_51 = internal dso_local global [15920 x i8] zeroinitializer, align 16
@__compressedAssemblyData_52 = internal dso_local global [15912 x i8] zeroinitializer, align 16
@__compressedAssemblyData_53 = internal dso_local global [35376 x i8] zeroinitializer, align 16
@__compressedAssemblyData_54 = internal dso_local global [197704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_55 = internal dso_local global [1140736 x i8] zeroinitializer, align 16
@__compressedAssemblyData_56 = internal dso_local global [95792 x i8] zeroinitializer, align 16
@__compressedAssemblyData_57 = internal dso_local global [36400 x i8] zeroinitializer, align 16
@__compressedAssemblyData_58 = internal dso_local global [27184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_59 = internal dso_local global [392776 x i8] zeroinitializer, align 16
@__compressedAssemblyData_60 = internal dso_local global [32816 x i8] zeroinitializer, align 16
@__compressedAssemblyData_61 = internal dso_local global [15912 x i8] zeroinitializer, align 16
@__compressedAssemblyData_62 = internal dso_local global [623664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_63 = internal dso_local global [15944 x i8] zeroinitializer, align 16
@__compressedAssemblyData_64 = internal dso_local global [35888 x i8] zeroinitializer, align 16
@__compressedAssemblyData_65 = internal dso_local global [672840 x i8] zeroinitializer, align 16
@__compressedAssemblyData_66 = internal dso_local global [1311792 x i8] zeroinitializer, align 16
@__compressedAssemblyData_67 = internal dso_local global [106024 x i8] zeroinitializer, align 16
@__compressedAssemblyData_68 = internal dso_local global [2094080 x i8] zeroinitializer, align 16
@__compressedAssemblyData_69 = internal dso_local global [216624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_70 = internal dso_local global [20016 x i8] zeroinitializer, align 16
@__compressedAssemblyData_71 = internal dso_local global [60464 x i8] zeroinitializer, align 16
@__compressedAssemblyData_72 = internal dso_local global [67112 x i8] zeroinitializer, align 16
@__compressedAssemblyData_73 = internal dso_local global [25648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_74 = internal dso_local global [63536 x i8] zeroinitializer, align 16
@__compressedAssemblyData_75 = internal dso_local global [70704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_76 = internal dso_local global [263240 x i8] zeroinitializer, align 16
@__compressedAssemblyData_77 = internal dso_local global [26160 x i8] zeroinitializer, align 16
@__compressedAssemblyData_78 = internal dso_local global [69192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_79 = internal dso_local global [340008 x i8] zeroinitializer, align 16
@__compressedAssemblyData_80 = internal dso_local global [27184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_81 = internal dso_local global [25136 x i8] zeroinitializer, align 16
@__compressedAssemblyData_82 = internal dso_local global [16944 x i8] zeroinitializer, align 16
@__compressedAssemblyData_83 = internal dso_local global [70184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_84 = internal dso_local global [38960 x i8] zeroinitializer, align 16
@__compressedAssemblyData_85 = internal dso_local global [34864 x i8] zeroinitializer, align 16
@__compressedAssemblyData_86 = internal dso_local global [16456 x i8] zeroinitializer, align 16
@__compressedAssemblyData_87 = internal dso_local global [22576 x i8] zeroinitializer, align 16
@__compressedAssemblyData_88 = internal dso_local global [15400 x i8] zeroinitializer, align 16
@__compressedAssemblyData_89 = internal dso_local global [53320 x i8] zeroinitializer, align 16
@__compressedAssemblyData_90 = internal dso_local global [15920 x i8] zeroinitializer, align 16
@__compressedAssemblyData_91 = internal dso_local global [16432 x i8] zeroinitializer, align 16
@__compressedAssemblyData_92 = internal dso_local global [16968 x i8] zeroinitializer, align 16
@__compressedAssemblyData_93 = internal dso_local global [82984 x i8] zeroinitializer, align 16
@__compressedAssemblyData_94 = internal dso_local global [16432 x i8] zeroinitializer, align 16
@__compressedAssemblyData_95 = internal dso_local global [40496 x i8] zeroinitializer, align 16
@__compressedAssemblyData_96 = internal dso_local global [65584 x i8] zeroinitializer, align 16
@__compressedAssemblyData_97 = internal dso_local global [216648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_98 = internal dso_local global [59440 x i8] zeroinitializer, align 16
@__compressedAssemblyData_99 = internal dso_local global [116784 x i8] zeroinitializer, align 16
@__compressedAssemblyData_100 = internal dso_local global [57392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_101 = internal dso_local global [50224 x i8] zeroinitializer, align 16
@__compressedAssemblyData_102 = internal dso_local global [606792 x i8] zeroinitializer, align 16
@__compressedAssemblyData_103 = internal dso_local global [29256 x i8] zeroinitializer, align 16
@__compressedAssemblyData_104 = internal dso_local global [34352 x i8] zeroinitializer, align 16
@__compressedAssemblyData_105 = internal dso_local global [18992 x i8] zeroinitializer, align 16
@__compressedAssemblyData_106 = internal dso_local global [46664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_107 = internal dso_local global [47664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_108 = internal dso_local global [31280 x i8] zeroinitializer, align 16
@__compressedAssemblyData_109 = internal dso_local global [70696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_110 = internal dso_local global [20016 x i8] zeroinitializer, align 16
@__compressedAssemblyData_111 = internal dso_local global [158208 x i8] zeroinitializer, align 16
@__compressedAssemblyData_112 = internal dso_local global [33832 x i8] zeroinitializer, align 16
@__compressedAssemblyData_113 = internal dso_local global [47664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_114 = internal dso_local global [110120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_115 = internal dso_local global [89136 x i8] zeroinitializer, align 16
@__compressedAssemblyData_116 = internal dso_local global [72232 x i8] zeroinitializer, align 16
@__compressedAssemblyData_117 = internal dso_local global [200776 x i8] zeroinitializer, align 16
@__compressedAssemblyData_118 = internal dso_local global [25136 x i8] zeroinitializer, align 16
@__compressedAssemblyData_119 = internal dso_local global [2500608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_120 = internal dso_local global [95272 x i8] zeroinitializer, align 16
@__compressedAssemblyData_121 = internal dso_local global [5734984 x i8] zeroinitializer, align 16
@__compressedAssemblyData_122 = internal dso_local global [95280 x i8] zeroinitializer, align 16
@__compressedAssemblyData_123 = internal dso_local global [15920 x i8] zeroinitializer, align 16
@__compressedAssemblyData_124 = internal dso_local global [26672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_125 = internal dso_local global [153672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_126 = internal dso_local global [27208 x i8] zeroinitializer, align 16
@__compressedAssemblyData_127 = internal dso_local global [2298440 x i8] zeroinitializer, align 16
@__compressedAssemblyData_128 = internal dso_local global [15944 x i8] zeroinitializer, align 16
@__compressedAssemblyData_129 = internal dso_local global [54320 x i8] zeroinitializer, align 16
@__compressedAssemblyData_130 = internal dso_local global [27720 x i8] zeroinitializer, align 16
@__compressedAssemblyData_131 = internal dso_local global [16456 x i8] zeroinitializer, align 16
@__compressedAssemblyData_132 = internal dso_local global [546888 x i8] zeroinitializer, align 16
@__compressedAssemblyData_133 = internal dso_local global [16424 x i8] zeroinitializer, align 16
@__compressedAssemblyData_134 = internal dso_local global [311880 x i8] zeroinitializer, align 16
@__compressedAssemblyData_135 = internal dso_local global [15664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_136 = internal dso_local global [15624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_137 = internal dso_local global [15672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_138 = internal dso_local global [15672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_139 = internal dso_local global [15648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_140 = internal dso_local global [15624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_141 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_142 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_143 = internal dso_local global [15664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_144 = internal dso_local global [15672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_145 = internal dso_local global [15624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_146 = internal dso_local global [15664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_147 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_148 = internal dso_local global [15624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_149 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_150 = internal dso_local global [15672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_151 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_152 = internal dso_local global [15624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_153 = internal dso_local global [15632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_154 = internal dso_local global [15664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_155 = internal dso_local global [15632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_156 = internal dso_local global [15632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_157 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_158 = internal dso_local global [15632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_159 = internal dso_local global [15648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_160 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_161 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_162 = internal dso_local global [15672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_163 = internal dso_local global [15632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_164 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_165 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_166 = internal dso_local global [15632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_167 = internal dso_local global [15640 x i8] zeroinitializer, align 16
@__compressedAssemblyData_168 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_169 = internal dso_local global [717824 x i8] zeroinitializer, align 16
@__compressedAssemblyData_170 = internal dso_local global [307536 x i8] zeroinitializer, align 16
@__compressedAssemblyData_171 = internal dso_local global [429864 x i8] zeroinitializer, align 16
@__compressedAssemblyData_172 = internal dso_local global [17192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_173 = internal dso_local global [15184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_174 = internal dso_local global [33064 x i8] zeroinitializer, align 16
@__compressedAssemblyData_175 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_176 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_177 = internal dso_local global [89384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_178 = internal dso_local global [255272 x i8] zeroinitializer, align 16
@__compressedAssemblyData_179 = internal dso_local global [47912 x i8] zeroinitializer, align 16
@__compressedAssemblyData_180 = internal dso_local global [47952 x i8] zeroinitializer, align 16
@__compressedAssemblyData_181 = internal dso_local global [126248 x i8] zeroinitializer, align 16
@__compressedAssemblyData_182 = internal dso_local global [102184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_183 = internal dso_local global [16720 x i8] zeroinitializer, align 16
@__compressedAssemblyData_184 = internal dso_local global [26448 x i8] zeroinitializer, align 16
@__compressedAssemblyData_185 = internal dso_local global [41768 x i8] zeroinitializer, align 16
@__compressedAssemblyData_186 = internal dso_local global [315176 x i8] zeroinitializer, align 16
@__compressedAssemblyData_187 = internal dso_local global [16168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_188 = internal dso_local global [19280 x i8] zeroinitializer, align 16
@__compressedAssemblyData_189 = internal dso_local global [50512 x i8] zeroinitializer, align 16
@__compressedAssemblyData_190 = internal dso_local global [23336 x i8] zeroinitializer, align 16
@__compressedAssemblyData_191 = internal dso_local global [1016104 x i8] zeroinitializer, align 16
@__compressedAssemblyData_192 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_193 = internal dso_local global [24872 x i8] zeroinitializer, align 16
@__compressedAssemblyData_194 = internal dso_local global [16168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_195 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_196 = internal dso_local global [184144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_197 = internal dso_local global [28968 x i8] zeroinitializer, align 16
@__compressedAssemblyData_198 = internal dso_local global [126800 x i8] zeroinitializer, align 16
@__compressedAssemblyData_199 = internal dso_local global [25936 x i8] zeroinitializer, align 16
@__compressedAssemblyData_200 = internal dso_local global [31568 x i8] zeroinitializer, align 16
@__compressedAssemblyData_201 = internal dso_local global [15184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_202 = internal dso_local global [58704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_203 = internal dso_local global [16208 x i8] zeroinitializer, align 16
@__compressedAssemblyData_204 = internal dso_local global [64296 x i8] zeroinitializer, align 16
@__compressedAssemblyData_205 = internal dso_local global [20304 x i8] zeroinitializer, align 16
@__compressedAssemblyData_206 = internal dso_local global [16208 x i8] zeroinitializer, align 16
@__compressedAssemblyData_207 = internal dso_local global [96040 x i8] zeroinitializer, align 16
@__compressedAssemblyData_208 = internal dso_local global [121128 x i8] zeroinitializer, align 16
@__compressedAssemblyData_209 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_210 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_211 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_212 = internal dso_local global [40744 x i8] zeroinitializer, align 16
@__compressedAssemblyData_213 = internal dso_local global [15184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_214 = internal dso_local global [37672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_215 = internal dso_local global [109864 x i8] zeroinitializer, align 16
@__compressedAssemblyData_216 = internal dso_local global [32040 x i8] zeroinitializer, align 16
@__compressedAssemblyData_217 = internal dso_local global [47952 x i8] zeroinitializer, align 16
@__compressedAssemblyData_218 = internal dso_local global [15184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_219 = internal dso_local global [54608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_220 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_221 = internal dso_local global [43304 x i8] zeroinitializer, align 16
@__compressedAssemblyData_222 = internal dso_local global [48424 x i8] zeroinitializer, align 16
@__compressedAssemblyData_223 = internal dso_local global [78120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_224 = internal dso_local global [23376 x i8] zeroinitializer, align 16
@__compressedAssemblyData_225 = internal dso_local global [67368 x i8] zeroinitializer, align 16
@__compressedAssemblyData_226 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_227 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_228 = internal dso_local global [575272 x i8] zeroinitializer, align 16
@__compressedAssemblyData_229 = internal dso_local global [223056 x i8] zeroinitializer, align 16
@__compressedAssemblyData_230 = internal dso_local global [76072 x i8] zeroinitializer, align 16
@__compressedAssemblyData_231 = internal dso_local global [148776 x i8] zeroinitializer, align 16
@__compressedAssemblyData_232 = internal dso_local global [55592 x i8] zeroinitializer, align 16
@__compressedAssemblyData_233 = internal dso_local global [56144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_234 = internal dso_local global [676136 x i8] zeroinitializer, align 16
@__compressedAssemblyData_235 = internal dso_local global [131368 x i8] zeroinitializer, align 16
@__compressedAssemblyData_236 = internal dso_local global [174376 x i8] zeroinitializer, align 16
@__compressedAssemblyData_237 = internal dso_local global [51536 x i8] zeroinitializer, align 16
@__compressedAssemblyData_238 = internal dso_local global [65832 x i8] zeroinitializer, align 16
@__compressedAssemblyData_239 = internal dso_local global [55592 x i8] zeroinitializer, align 16
@__compressedAssemblyData_240 = internal dso_local global [106832 x i8] zeroinitializer, align 16
@__compressedAssemblyData_241 = internal dso_local global [172880 x i8] zeroinitializer, align 16
@__compressedAssemblyData_242 = internal dso_local global [161616 x i8] zeroinitializer, align 16
@__compressedAssemblyData_243 = internal dso_local global [253224 x i8] zeroinitializer, align 16
@__compressedAssemblyData_244 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_245 = internal dso_local global [234832 x i8] zeroinitializer, align 16
@__compressedAssemblyData_246 = internal dso_local global [70440 x i8] zeroinitializer, align 16
@__compressedAssemblyData_247 = internal dso_local global [33104 x i8] zeroinitializer, align 16
@__compressedAssemblyData_248 = internal dso_local global [23376 x i8] zeroinitializer, align 16
@__compressedAssemblyData_249 = internal dso_local global [51536 x i8] zeroinitializer, align 16
@__compressedAssemblyData_250 = internal dso_local global [103248 x i8] zeroinitializer, align 16
@__compressedAssemblyData_251 = internal dso_local global [17232 x i8] zeroinitializer, align 16
@__compressedAssemblyData_252 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_253 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_254 = internal dso_local global [41256 x i8] zeroinitializer, align 16
@__compressedAssemblyData_255 = internal dso_local global [851792 x i8] zeroinitializer, align 16
@__compressedAssemblyData_256 = internal dso_local global [102696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_257 = internal dso_local global [153384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_258 = internal dso_local global [3099432 x i8] zeroinitializer, align 16
@__compressedAssemblyData_259 = internal dso_local global [38184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_260 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_261 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_262 = internal dso_local global [129832 x i8] zeroinitializer, align 16
@__compressedAssemblyData_263 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_264 = internal dso_local global [501032 x i8] zeroinitializer, align 16
@__compressedAssemblyData_265 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_266 = internal dso_local global [23888 x i8] zeroinitializer, align 16
@__compressedAssemblyData_267 = internal dso_local global [16168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_268 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_269 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_270 = internal dso_local global [26408 x i8] zeroinitializer, align 16
@__compressedAssemblyData_271 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_272 = internal dso_local global [17192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_273 = internal dso_local global [17704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_274 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_275 = internal dso_local global [38184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_276 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_277 = internal dso_local global [64336 x i8] zeroinitializer, align 16
@__compressedAssemblyData_278 = internal dso_local global [17192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_279 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_280 = internal dso_local global [143144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_281 = internal dso_local global [65832 x i8] zeroinitializer, align 16
@__compressedAssemblyData_282 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_283 = internal dso_local global [23376 x i8] zeroinitializer, align 16
@__compressedAssemblyData_284 = internal dso_local global [16680 x i8] zeroinitializer, align 16
@__compressedAssemblyData_285 = internal dso_local global [16680 x i8] zeroinitializer, align 16
@__compressedAssemblyData_286 = internal dso_local global [44328 x i8] zeroinitializer, align 16
@__compressedAssemblyData_287 = internal dso_local global [58192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_288 = internal dso_local global [53544 x i8] zeroinitializer, align 16
@__compressedAssemblyData_289 = internal dso_local global [17192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_290 = internal dso_local global [16168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_291 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_292 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_293 = internal dso_local global [15184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_294 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_295 = internal dso_local global [16680 x i8] zeroinitializer, align 16
@__compressedAssemblyData_296 = internal dso_local global [704808 x i8] zeroinitializer, align 16
@__compressedAssemblyData_297 = internal dso_local global [37672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_298 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_299 = internal dso_local global [15184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_300 = internal dso_local global [18216 x i8] zeroinitializer, align 16
@__compressedAssemblyData_301 = internal dso_local global [16680 x i8] zeroinitializer, align 16
@__compressedAssemblyData_302 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_303 = internal dso_local global [740648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_304 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_305 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_306 = internal dso_local global [69968 x i8] zeroinitializer, align 16
@__compressedAssemblyData_307 = internal dso_local global [617256 x i8] zeroinitializer, align 16
@__compressedAssemblyData_308 = internal dso_local global [368976 x i8] zeroinitializer, align 16
@__compressedAssemblyData_309 = internal dso_local global [56656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_310 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_311 = internal dso_local global [185680 x i8] zeroinitializer, align 16
@__compressedAssemblyData_312 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_313 = internal dso_local global [61224 x i8] zeroinitializer, align 16
@__compressedAssemblyData_314 = internal dso_local global [16680 x i8] zeroinitializer, align 16
@__compressedAssemblyData_315 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_316 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_317 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_318 = internal dso_local global [44880 x i8] zeroinitializer, align 16
@__compressedAssemblyData_319 = internal dso_local global [175400 x i8] zeroinitializer, align 16
@__compressedAssemblyData_320 = internal dso_local global [16168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_321 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_322 = internal dso_local global [30504 x i8] zeroinitializer, align 16
@__compressedAssemblyData_323 = internal dso_local global [15144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_324 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_325 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_326 = internal dso_local global [21840 x i8] zeroinitializer, align 16
@__compressedAssemblyData_327 = internal dso_local global [16168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_328 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_329 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_330 = internal dso_local global [15656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_331 = internal dso_local global [15696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_332 = internal dso_local global [17704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_333 = internal dso_local global [23336 x i8] zeroinitializer, align 16
@__compressedAssemblyData_334 = internal dso_local global [50472 x i8] zeroinitializer, align 16
@__compressedAssemblyData_335 = internal dso_local global [16168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_336 = internal dso_local global [59688 x i8] zeroinitializer, align 16
@__compressedAssemblyData_337 = internal dso_local global [100648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_338 = internal dso_local global [240200 x i8] zeroinitializer, align 16
@__compressedAssemblyData_339 = internal dso_local global [82968 x i8] zeroinitializer, align 16
@__compressedAssemblyData_340 = internal dso_local global [19528 x i8] zeroinitializer, align 16
@__compressedAssemblyData_341 = internal dso_local global [37450312 x i8] zeroinitializer, align 16
@__compressedAssemblyData_342 = internal dso_local global [4776784 x i8] zeroinitializer, align 16

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 1dcfb6f8779c33b6f768c996495cb90ecd729329"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
