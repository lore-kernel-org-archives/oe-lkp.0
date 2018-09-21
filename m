Content-Type: multipart/mixed; boundary="===============0872545246529403418=="
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@google.com>
To: lkp@lists.01.org
Subject: Re: 7b5b51e7b3 qemux86-64: can't read binary file (No such file or directory)
Date: Fri, 21 Sep 2018 19:45:30 +0200
Message-ID: <CAAeHK+wqxNDpPTg9g6WDHJigeOUBnHfbv_6_RRaAY3356X4t3g@mail.gmail.com>
In-Reply-To: <CAAeHK+zsPYaLKraWO1mFbKOy0DpfR5sXA6ymWXDna8oJp=BWdQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0872545246529403418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 7:08 PM, Andrey Konovalov <andreyknvl@google.com>=
 wrote:
> On Fri, Sep 21, 2018 at 3:46 AM, Rong Chen <rong.a.chen@intel.com> wrot=
e:
>>
>>
>> On 09/21/2018 12:11 AM, Andrey Konovalov wrote:
>>
>> On Wed, Sep 19, 2018 at 2:47 AM, Rong Chen <rong.a.chen@intel.com> wro=
te:
>>
>> Could you help to compare the 0day-ci repo
>> (https://github.com/0day-ci/linux/commits/Andrey-Konovalov/arm64-untag-u=
ser-pointers-passed-to-the-kernel/20180831-042151)
>> with your repo if there's no problem on your repo? btw, 0day robot merged
>> the patchset based on v4.19-rc1, is this right?
>>
>> The repos are almost identical, 0day one has a few more commits than
>> the one that I have, but I doubt that would affect anything. Yes,
>> 4.19-rc1.
>>
>> Honestly I feel hesitant to run some script I don't understand on my
>> machine. Can I reproduce this somehow within a booted QEMU with kernel
>> that includes this patchset?
>>
>> Enclosed please find the native qemu script to reproduce it.
>>
>> login: root
>> command to reproduce: for i in $(seq 50); do ls /; done
>
> Thanks for this short reproducer! I was able to reproduce this, looking i=
nto it.

I've found the issue, it's a bad annotation of "bprm->p =3D
STACK_ROUND(sp, items);" in fs/binfmt_elf.c in the last patch
(subtraction in STACK_ROUND need to happen before the cast to unsigned
long). I'll fix this in the next version if I don't drop this patch at
all.

Thanks!

--===============0872545246529403418==--

