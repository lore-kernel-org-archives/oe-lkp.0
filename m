Content-Type: multipart/mixed; boundary="===============4823480265717594290=="
MIME-Version: 1.0
From: Shuah Khan <skhan@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [tools headers UAPI] e2bcbd7769: kernel-selftests.ir.make_fail
Date: Fri, 28 Jan 2022 10:27:52 -0700
Message-ID: <e5b72f09-a208-a579-3e51-10935ccee1ff@linuxfoundation.org>
In-Reply-To: <CAADnVQJ3RCPUQ0k9nu2urrRK=U7SUetuPmY0_b17M_PD=j4fkw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4823480265717594290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/28/22 9:49 AM, Alexei Starovoitov wrote:
> On Fri, Jan 28, 2022 at 1:32 AM Sean Young <sean@mess.org> wrote:
>>

>>> ir_loopback.c: In function =E2=80=98main=E2=80=99:
>>> ir_loopback.c:147:20: error: =E2=80=98RC_PROTO_RCMM32=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98RC_PROTO_RC6_MCE=E2=
=80=99?
>>>      if (rc_proto =3D=3D RC_PROTO_RCMM32 &&
>>>                      ^~~~~~~~~~~~~~~
>>>                      RC_PROTO_RC6_MCE
>>
>> So this commit removes the copy of lirc.h from tools/include/uapi/linux/=
lirc.h,
>> so now the test uses /usr/include/linux/lirc.h. It appears that this file
>> does not have RC_PROTO_RCMM32 defined on this system, which means it is a
>> kernel header from v5.1 or earlier (this was added in commit
>> 721074b03411327e7bf41555d4cc7c18f49313f7).
>>
>> It looks like this machine is redhat 8.3, which ships with kernel 4.18.
>>
>> I guess my change was far too optimistic; I had no ideal enterprise kern=
els
>> were so ancient.
>>
>> We should probably drop e2bcbd7769ee8f05e1b3d10848aace98973844e4. Sorry =
about
>> the turbulence.
> =

> I'd rather avoid reverting.
> Just add ifdef or something to shut up the error on old distros.
> =


Sean,

Let's not add release checks.

Since RC_PROTO_RCMM32 is the only one missing, perhaps you could define
just that one in ir_loopback.c with a comment that it can be removed.

ifndef RC_PROTO_RCMM32 ---

thanks,
-- Shuah


--===============4823480265717594290==--

