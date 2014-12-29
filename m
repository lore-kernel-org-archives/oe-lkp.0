Content-Type: multipart/mixed; boundary="===============8776715536155573528=="
MIME-Version: 1.0
From: Oded Gabbay <oded.gabbay@amd.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] drm/radeon: Init amdkfd only if it was compiled
Date: Mon, 29 Dec 2014 14:49:47 +0200
Message-ID: <54A14DEB.4090503@amd.com>
In-Reply-To: <54A14C0C.8090401@vodafone.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8776715536155573528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/29/2014 02:41 PM, Christian K=C3=B6nig wrote:
> Am 29.12.2014 um 09:59 schrieb Oded Gabbay:
>> This patch changes the radeon_kfd_init(), which is used to initialize the
>> interface between radeon and amdkfd, so the interface will be initialize=
d only
>> if amdkfd was build, either as module or inside the kernel image.
>>
>> In the modules case, the symbol_request() will be used (same as old code=
). In
>> the in-image compilation case, a direct call to kgd2kfd_init() will be d=
one.
>> For other cases, radeon_kfd_init() will just return false.
>>
>> This patch is necessary because in case of the following specific
>> configuration: kernel 32-bit, no modules support, random kernel base and=
 no
>> hibernation, the symbol_request() doesn't work as expected - it doesn't =
return
>> NULL if the symbol doesn't exists - which makes the kernel panic.
>>
>> Signed-off-by: Oded Gabbay <oded.gabbay@amd.com>
>
> Using symbol_request() in general doesn't seem to be such a good idea, be=
cause
> it breaks symbol versioning and as far as I can see is only very rarely u=
sed in
> drivers (AFAIK only V4L drivers).
>
> But for the moment I don't have another idea either except for always loa=
ding
> the module which on most hardware is completely unnecessary. Maybe we sho=
uld
> consider restructuring the module load dependencies in the next kernel re=
lease.
>
> For now the patch is Reviewed-by: Christian K=C3=B6nig <christian.koenig(=
a)amd.com>
>
Thanks Christian.
I agree that this is somewhat a mess, that was created unfortunately at the=
 very =

beginning of kfd.

We will definitely fix this in 2015, as we also need to think how kfd will =

integrate with both radeon and amdgpu if they are present on the same syste=
m. =

The current method we use doesn't enable that situation.

Ideally, I would like to see total separation (between init of radeon and i=
nit =

of amdkfd) and use of exported symbols instead of symbol_request. Couple th=
at =

with probe deferral and I think the end result will be much better than the =

current design.

	Oded

>> ---
>>   drivers/gpu/drm/radeon/radeon_kfd.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_kfd.c
>> b/drivers/gpu/drm/radeon/radeon_kfd.c
>> index 242fd8b..d3e78b4 100644
>> --- a/drivers/gpu/drm/radeon/radeon_kfd.c
>> +++ b/drivers/gpu/drm/radeon/radeon_kfd.c
>> @@ -101,6 +101,7 @@ static const struct kgd2kfd_calls *kgd2kfd;
>>   bool radeon_kfd_init(void)
>>   {
>> +#if defined(CONFIG_HSA_AMD_MODULE)
>>       bool (*kgd2kfd_init_p)(unsigned, const struct kfd2kgd_calls*,
>>                   const struct kgd2kfd_calls**);
>> @@ -117,6 +118,17 @@ bool radeon_kfd_init(void)
>>       }
>>       return true;
>> +#elif defined(CONFIG_HSA_AMD)
>> +    if (!kgd2kfd_init(KFD_INTERFACE_VERSION, &kfd2kgd, &kgd2kfd)) {
>> +        kgd2kfd =3D NULL;
>> +
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +#else
>> +    return false;
>> +#endif
>>   }
>>   void radeon_kfd_fini(void)
>

--===============8776715536155573528==--

