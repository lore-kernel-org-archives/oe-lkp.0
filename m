Content-Type: multipart/mixed; boundary="===============8529369009255314450=="
MIME-Version: 1.0
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: lkp@lists.01.org
Subject: Re: [dmi] PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 ffffffffff240000
Date: Fri, 07 Nov 2014 10:40:22 +0100
Message-ID: <CAKv+Gu_YzZUqZBGAb+U8MGEfUQ8-yyCPj=QMeEbamKxSi8Wb5A@mail.gmail.com>
In-Reply-To: <1415352966.14686.101.camel@mfleming-mobl1.ger.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8529369009255314450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7 November 2014 10:36, Matt Fleming <matt.fleming@intel.com> wrote:
> On Fri, 2014-11-07 at 17:26 +0800, Yuanhan Liu wrote:
>>
>> Here is the output:
>>
>> [    0.000000] NX (Execute Disable) protection: active
>> [    0.000000] =3D=3D=3D=3D=3D=3D Decoding _DMI_ header:
>> [    0.000000] 5f 44 4d 49 5f 48 a3 0b 00 20 60 8f 3e 00 25 00
>> [    0.000000] =3D=3D=3D=3D=3D=3D Remapped SMBIOS table 0xffffffff8f6020=
00 at ffffffffff240000, size 0xba3, num 0x3e
>
> Smells like a sign extension issue. Previously how could dmi_base (u32)
> hold 0xffffffff8f602000?
>

Exactly. And note that we already found (and fixed, or so we thought)
this issue.

I.e, on the ARM you get

>>> =3D=3D=3D=3D=3D=3D Remapped SMBIOS table 0xfe8ac000 at ffffff800001e000=
, size 0x262, num 0xc

which has the top bit set as well, but is handled correctly, whereas
with the original code (i.e., before adding the get_unaligned_le32()),
we were hitting the same problem.

-- =

Ard.

--===============8529369009255314450==--

