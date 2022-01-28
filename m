Content-Type: multipart/mixed; boundary="===============8036820242641374913=="
MIME-Version: 1.0
From: Shuah Khan <skhan@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [tools headers UAPI] e2bcbd7769: kernel-selftests.ir.make_fail
Date: Fri, 28 Jan 2022 10:57:35 -0700
Message-ID: <347bae9f-f775-4976-3d27-b0c725211d78@linuxfoundation.org>
In-Reply-To: <YfQqI2ryOYEDuvON@gofer.mess.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8036820242641374913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/28/22 10:38 AM, Sean Young wrote:
> On Fri, Jan 28, 2022 at 10:27:52AM -0700, Shuah Khan wrote:
>> On 1/28/22 9:49 AM, Alexei Starovoitov wrote:
>>> On Fri, Jan 28, 2022 at 1:32 AM Sean Young <sean@mess.org> wrote:
>>>>
>>
>>>>> ir_loopback.c: In function =E2=80=98main=E2=80=99:
>>>>> ir_loopback.c:147:20: error: =E2=80=98RC_PROTO_RCMM32=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98RC_PROTO_RC6_MCE=
=E2=80=99?
>>>>>       if (rc_proto =3D=3D RC_PROTO_RCMM32 &&
>>>>>                       ^~~~~~~~~~~~~~~
>>>>>                       RC_PROTO_RC6_MCE
>>>>
>>>> So this commit removes the copy of lirc.h from tools/include/uapi/linu=
x/lirc.h,
>>>> so now the test uses /usr/include/linux/lirc.h. It appears that this f=
ile
>>>> does not have RC_PROTO_RCMM32 defined on this system, which means it i=
s a
>>>> kernel header from v5.1 or earlier (this was added in commit
>>>> 721074b03411327e7bf41555d4cc7c18f49313f7).
>>>>
>>>> It looks like this machine is redhat 8.3, which ships with kernel 4.18.
>>>>
>>>> I guess my change was far too optimistic; I had no ideal enterprise ke=
rnels
>>>> were so ancient.

> Hi Shuah,
> =

> I was thinking along the same lines, however RC_PROTO_RCMM32 is an enum
> value so a pre-processor #ifdef is not going to work. At the moment I hav=
en't
> had any bright ideas other than doing a `#define RC_PROTO_RCMM32 26` at t=
he
> top of the file.
> =


One more idea. Let's see if this works. Check for RC_PROTO_MAX if it existed
before this commit that RC_PROTO_RCMM32, you could define RC_PROTO_RCMM32
conditionally in the test scope. If not let's go woth your plan of defining
it at the top with some info.

thanks,
-- Shuah
--===============8036820242641374913==--

