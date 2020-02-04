Content-Type: multipart/mixed; boundary="===============1078015759575004093=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: lkp ncompare result interpetation
Date: Tue, 04 Feb 2020 14:42:51 +0800
Message-ID: <20200204064251.GA20734@intel.com>
In-Reply-To: <CACOpkY697dr7H6Q58gADTDLDKtb1iUbC6-Dr=Z63RUuEEmyR5w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1078015759575004093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2020 at 11:15:11AM +0530, Bincy Philip wrote:
> *Hi,*
> =

> *I am new to lkp test suite.I have installed it and found useful in
> comparing different kernel versions.*
Thanks Bincy for trying it. Would you mind submitting an issue at
https://github.com/intel/lkp-tests, we will have member to support it.

Thanks

> =

> *Can somebody help me to understand it better way.Attached is the lkp
> compare test result.Column headings are unclear to me.*
> =

> *What does 5322 and 379 mean in the attached result?How can I say which
> kernel is good from the result?*
> =

> =

> lkp ncompare -s commit=3D"3.10.0-1062.9.1.el7.x86_64" -o commit=3D"3.18.0=
-rc5" -a
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/ipc/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
>   gcc-7/pipe/x86_64-rhel-7.6/process/1600%/centos/bn1dhcp244-49.mvista.co=
m/hackbench
> =

> commit:
>   3.10.0-1062.9.1.el7.x86_64
>   3.18.0-rc5
> =

> 3.10.0-1062.9.1.                  3.18.0-rc5
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>        5322:1      -494373%         379:1     dmesg.timestamp:last
>        5322:1      -494373%         379:1     kmsg.timestamp:last
> =

> =

> Thanks in Advance!!!
> =

> Bincy

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============1078015759575004093==--

