Content-Type: multipart/mixed; boundary="===============4616069258483944073=="
MIME-Version: 1.0
From: Christian König <deathsimple@vodafone.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Thu, 25 Dec 2014 13:31:10 +0100
Message-ID: <549C038E.1030206@vodafone.de>
In-Reply-To: <54986EA2.106@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4616069258483944073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am 22.12.2014 um 20:18 schrieb Oded Gabbay:
>
> On 12/22/2014 09:00 PM, Andi Kleen wrote:
>> On Mon, Dec 22, 2014 at 10:49:40AM -0800, Andi Kleen wrote:
>>> On Mon, Dec 22, 2014 at 11:58:43AM -0500, Alex Deucher wrote:
>>>> On Mon, Dec 22, 2014 at 6:11 AM, Oded Gabbay <oded.gabbay@amd.com> w=
rote:
>>>>> amdkfd driver can be compiled only in 64-bit kernel. Therefore, there=
 is no
>>>>> point in trying to initialize amdkfd in 32-bit kernel.
>>>>>
>>>>> In addition, in case of specific configuration of 32-bit kernel, no m=
odules and
>>>>> random kernel base, the symbol_request function doesn't work as expec=
ted - It
>>>>> doesn't return NULL if the symbol doesn't exists. That makes the kern=
el panic.
>>>>> Therefore, the as amdkfd doesn't compile in 32-bit kernel, the best w=
ay is just
>>>>> to return false immediately.
>>>>>
>>>>> Signed-off-by: Oded Gabbay <oded.gabbay@amd.com>
>>>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>> Sorry but the patch is just bogus. X-bit only code is usually
>>> a very bad sign for the code. This is not windows programing after all.
> Hi Andi,
>
> Strange, I have never programmed for Windows in my life (except maybe in a
> few courses during my degree) :)
>>> Even if you wanted to do a 64bit only driver -- which
>>> you probably don't -- the standard way would be to exclude
>>> it in Kconfig.
> So amdkfd actually *only* supports 64bit user processes, because AMD's HSA
> stack on Linux supports *only* 64bit user processes. So, yes, I definitely
> want to do a 64bit only driver.
> If you look at kfd_open(), it fails the open of /dev/kfd if the process is
> 32bit.
> In addition, in Kconfig of amdkfd, it is written:
> "depends on DRM_RADEON && AMD_IOMMU_V2 && X86_64"
>
> The problem here is that there is code in radeon, which is a driver that =
can
> compile in 32bit, which tries to load amdkfd. I didn't see a point in try=
ing
> to load a driver which can't be compiled in 32bit.

Well in this case couldn't we make the code in radeon depend on whether =

or not the KFD driver is compiled in or not instead of checking the =

system architecture?

Regards,
Christian.

>
>>> Please root-cause why symbol_request doesn't work on 32bit
>>> and fix it properly.
> I didn't say it doesn't always work.
> The actual thing that doesn't work is the define symbol_get and only in a
> specific case of 32bit kernel AND CONFIG_MODULES is unset AND
> CONFIG_RANDOMIZE_BASE is set.
> The define in that case is:
> #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak)); &(x); =
})
>
> Why it doesn't work (doesn't return NULL when symbol doesn't exists) ?
> I don't know, probably because of some elf/makefile/c language magic. I'm
> not that big of an expert on those issues, and I wanted to provide a fix =
for
> this problem during the -rc stages. If someone can help me solving the ro=
ot
> cause, I would be more than happy.
>
> 	Oded
>>> +rusty.
>> And also with correct email.
>>
>> -Andi
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel(a)lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel


--===============4616069258483944073==--

