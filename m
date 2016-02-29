Content-Type: multipart/mixed; boundary="===============7723229037038569164=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Mon, 29 Feb 2016 09:37:47 -0800
Message-ID: <20160229173747.GA17288@linux-uzut.site>
In-Reply-To: <20160229093708.GA21037@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7723229037038569164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Feb 2016, Ingo Molnar wrote:

>
>* kernel test robot <ying.huang@linux.intel.com> wrote:
>
>> FYI, we noticed the below changes on
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit 65d8fc777f6dcfee12785c057a6b57f679641c90 ("futex: Remove requirem=
ent for
>> lock_page() in get_futex_key()")
>
>I have asked for this before, but let me try again: could you _PLEASE_ mak=
e these
>emails more readable?
>
>For example what are the 'below changes'? Changes in the profile output? P=
rofiles
>always change from run to run, so that alone is not informative.
>
>Also, there are a lot of changes - which ones prompted the email to be gen=
erated?
>
>All in one, this email is hard to parse, because it just dumps a lot of
>information with very little explanatory structure for someone not versed =
in their
>format. Please try to create an easy to parse 'story' that leads the reader
>towards what you want these emails to tell - not just a raw dump of seemin=
gly
>unconnected pieces of data ...
>=C3=A2=C2=86=C2=93
>Thanks,
>
>	Ingo
>
>>
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04=
/futex1/will-it-scale

If I'm reading this correctly, it is similar to what I measured wrt ~lockle=
less get_futex_key()
stuff using the perf runs, with similar performance improvement numbers (pe=
r process/thread ops).
The futex1 test will just pound on FUTEX_WAKE without anyone actually block=
ed on a futex, so it
mainly measures the key/hashing part of the operation.

Thanks,
Davidlohr

--===============7723229037038569164==--

