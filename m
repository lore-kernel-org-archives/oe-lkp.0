Content-Type: multipart/mixed; boundary="===============8304123779375964279=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Wed, 17 Aug 2022 15:04:06 +0100
Message-ID: <743867a6-b266-58e4-a8a6-542757916f0a@huawei.com>
In-Reply-To: <YvzyZJUblfqN6Xj3@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8304123779375964279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 17/08/2022 14:51, Oliver Sang wrote:

Hi Oliver,

>> v5.19 + 0568e61225 : 512/512
>> v5.19 + 0568e61225 + 4cbfca5f77 : 512/512
>> v5.19: 1280/32767
>>
>> They are want makes sense to me, at least.
>>
>> Oliver, can you confirm this? Thanks!
> I confirm below two:
> v5.19 + 0568e61225 : 512/512
> v5.19: 1280/32767 (as last already reported)

ack

> =

> but below failed to build:
> v5.19 + 0568e61225 + 4cbfca5f77
> =

> build_errors:
>    - "drivers/scsi/scsi_transport_sas.c:242:33: error: implicit declarati=
on of function 'dma_opt_mapping_size'; did you mean 'dma_max_mapping_size'?=
 [-Werror=3Dimplicit-function-declaration]"
>    - "drivers/scsi/scsi_transport_sas.c:241:24: error: 'struct Scsi_Host'=
 has no member named 'opt_sectors'; did you mean 'max_sectors'?"
> =

> not sure if I understand this correctly?
> for this, I just cherry-pick 0568e61225 upon v5.19,
> then cherry-pick 4cbfca5f77 again.
> so my branch looks like:
> =

> a11d8b97c3ecb8 v5.19 + 0568e61225 + 4cbfca5f77
> 1b59440cf71f99 v5.19 + 0568e61225
> 3d7cb6b04c3f31 (tag: v5.19,
> =

> did I do the right thing?

Sorry but I was not really interested in 4cbfca5f77 and I see where that =

build error is coming, but don't be concerned with it. However, for =

avoidance of doubt, if you have results for vanilla v6.0-rc1 then that =

would be appreciated.

I will also send a separate patch for testing if you don't mind.

thanks,
John

--===============8304123779375964279==--

