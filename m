Content-Type: multipart/mixed; boundary="===============0500221482144744585=="
MIME-Version: 1.0
From: Oded Gabbay <oded.gabbay@amd.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Mon, 22 Dec 2014 21:18:58 +0200
Message-ID: <54986EA2.106@amd.com>
In-Reply-To: <20141222190041.GC17192@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0500221482144744585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/22/2014 09:00 PM, Andi Kleen wrote:
> On Mon, Dec 22, 2014 at 10:49:40AM -0800, Andi Kleen wrote:
>> On Mon, Dec 22, 2014 at 11:58:43AM -0500, Alex Deucher wrote:
>>> On Mon, Dec 22, 2014 at 6:11 AM, Oded Gabbay <oded.gabbay@amd.com> wr=
ote:
>>>> amdkfd driver can be compiled only in 64-bit kernel. Therefore, there =
is no
>>>> point in trying to initialize amdkfd in 32-bit kernel.
>>>>
>>>> In addition, in case of specific configuration of 32-bit kernel, no mo=
dules and
>>>> random kernel base, the symbol_request function doesn't work as expect=
ed - It
>>>> doesn't return NULL if the symbol doesn't exists. That makes the kerne=
l panic.
>>>> Therefore, the as amdkfd doesn't compile in 32-bit kernel, the best wa=
y is just
>>>> to return false immediately.
>>>>
>>>> Signed-off-by: Oded Gabbay <oded.gabbay@amd.com>
>>>
>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> Sorry but the patch is just bogus. X-bit only code is usually
>> a very bad sign for the code. This is not windows programing after all.
Hi Andi,

Strange, I have never programmed for Windows in my life (except maybe in a
few courses during my degree) :)
>>
>> Even if you wanted to do a 64bit only driver -- which
>> you probably don't -- the standard way would be to exclude
>> it in Kconfig.
So amdkfd actually *only* supports 64bit user processes, because AMD's HSA
stack on Linux supports *only* 64bit user processes. So, yes, I definitely
want to do a 64bit only driver.
If you look at kfd_open(), it fails the open of /dev/kfd if the process is
32bit.
In addition, in Kconfig of amdkfd, it is written:
"depends on DRM_RADEON && AMD_IOMMU_V2 && X86_64"

The problem here is that there is code in radeon, which is a driver that can
compile in 32bit, which tries to load amdkfd. I didn't see a point in trying
to load a driver which can't be compiled in 32bit.

>>
>> Please root-cause why symbol_request doesn't work on 32bit
>> and fix it properly.
I didn't say it doesn't always work.
The actual thing that doesn't work is the define symbol_get and only in a
specific case of 32bit kernel AND CONFIG_MODULES is unset AND
CONFIG_RANDOMIZE_BASE is set.
The define in that case is:
#define symbol_get(x) ({ extern typeof(x) x __attribute__((weak)); &(x); })

Why it doesn't work (doesn't return NULL when symbol doesn't exists) ?
I don't know, probably because of some elf/makefile/c language magic. I'm
not that big of an expert on those issues, and I wanted to provide a fix for
this problem during the -rc stages. If someone can help me solving the root
cause, I would be more than happy.

	Oded
>>
>> +rusty.
> =

> And also with correct email.
> =

> -Andi
>=20

--===============0500221482144744585==--

