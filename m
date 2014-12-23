Content-Type: multipart/mixed; boundary="===============1638800849021661587=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [ftrace] fef5aeeee9e: -27.2% boot-slabinfo.num_objs
Date: Tue, 23 Dec 2014 08:32:14 -0500
Message-ID: <20141223083214.0b199465@gandalf.local.home>
In-Reply-To: <1419304217.26403.44.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1638800849021661587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Dec 2014 11:10:17 +0800
Huang Ying <ying.huang@intel.com> wrote:

> FYI, we noticed the below changes on
> =

> commit fef5aeeee9e3717e7aea991a7ae9ff6a7a2d4c85 ("ftrace: Replace tramp_h=
ash with old_*_hash to save space")
> =

> =

> testbox/testcase/testparams: vm-kbuild-4G/boot/1
> =

> e1effa0144a1ddf5  fef5aeeee9e3717e7aea991a7a  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>     437752 =C2=B1  0%     -27.2%     318545 =C2=B1  0%  boot-slabinfo.num=
_objs
> =

> vm-kbuild-4G: qemu-system-x86_64 -enable-kvm
> Memory: 4G

I have no idea what this test does. Is this good or bad? Is that -27.2%
a performance regression, or memory regression?

-- Steve


> =

> =

> =

>                                boot-slabinfo.num_objs
> =

>   440000 *+*--*-*-*------*----*-*-*--*--------*-*--*-*-*--*--------------=
---+
>          |           *.*   *.          *.*..*                            =
   |
>   420000 ++                                                              =
   |
>          |                                                               =
   |
>   400000 ++                                                              =
   |
>          |                                                               =
   |
>   380000 ++                                                              =
   |
>          |                                                               =
   |
>   360000 ++                                                              =
   |
>          |                                                               =
   |
>   340000 ++                                                              =
   |
>          |                                                               =
   |
>   320000 O+O  O   O  O O O O  O O O  O O    O O O    O O  O O O O  O O O =
 O O
>          |      O                        O         O                     =
   |
>   300000 ++--------------------------------------------------------------=
---+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

> 	apt-get install ruby ruby-oj
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Huang, Ying
> =



--===============1638800849021661587==--

