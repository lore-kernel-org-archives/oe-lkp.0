Content-Type: multipart/mixed; boundary="===============3800109735703543727=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: 5b4ed50902 ("sched/fair: Fix wake_affine() for !NUMA_BALANCING"): BUG: unable to handle kernel paging request at ffffffffffffff80
Date: Fri, 11 Aug 2017 11:10:16 +0800
Message-ID: <20170811031016.rnszkji6azgx5iij@wfg-t540p.sh.intel.com>
In-Reply-To: <20170810085017.vjtazcjkgjuzb5qo@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3800109735703543727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 10:50:17AM +0200, Peter Zijlstra wrote:
>On Thu, Aug 10, 2017 at 10:43:32AM +0200, Peter Zijlstra wrote:
>
>> > Desired=3DUnknown/Install/Remove/Purge/Hold
>> > | Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait=
/Trig-pend
>> > |/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
>> > ||/ Name                             Version               Architectur=
e          Description
>> > +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > ii  gcc-4.8                          4.8.4-1               amd64      =
           GNU C compiler
>> > ii  gcc-4.8-base:amd64               4.8.4-1               amd64      =
           GCC, the GNU Compiler Collection (base package)
>> > ii  gcc-4.8-multilib                 4.8.4-1               amd64      =
           GNU C compiler (multilib files)
>> > ii  gcc-4.8-plugin-dev               4.8.4-1               amd64      =
           Files for GNU GCC plugin development.
>>
>> My dev boxes seem to have:
>>
>> # dpkg -l | grep gcc-4.8
>> ii  gcc-4.8                                4.8.4-4 amd64        GNU C co=
mpiler
>> ii  gcc-4.8-base:amd64                     4.8.4-4 amd64        GCC, the=
 GNU Compiler Collection (base package)
>> ii  libgcc-4.8-dev:amd64                   4.8.4-4 amd64        GCC supp=
ort library (development files)
>>
>> slightly newer but should be similar enough I suppose.
>
>Hurm.. :-( Current debian doesn't feature plugin crud for the old
>compiler.

Yeah, I find that too when trying to reproduce it by hand. The
packages in the build server were installed long ago and seems no
longer exist in current Debian repository.

I just confirmed that gcc-4.9 built kernel boots fine. So gcc-4.8
seems the only one that suffers from this problem..

Thanks,
Fengguang

># apt-cache search plugin-dev
>gcc-6-plugin-dev - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-aarch64-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-arm-linux-gnueabi - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-arm-linux-gnueabihf - Files for GNU GCC plugin developmen=
t.
>gcc-6-plugin-dev-mips-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-mips64el-linux-gnuabi64 - Files for GNU GCC plugin develo=
pment.
>gcc-6-plugin-dev-mipsel-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-powerpc64le-linux-gnu - Files for GNU GCC plugin developm=
ent.
>gcc-6-plugin-dev-s390x-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-alpha-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-hppa-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-m68k-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-mips64-linux-gnuabi64 - Files for GNU GCC plugin developm=
ent.
>gcc-6-plugin-dev-powerpc-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-powerpc-linux-gnuspe - Files for GNU GCC plugin developme=
nt.
>gcc-6-plugin-dev-powerpc64-linux-gnu - Files for GNU GCC plugin developmen=
t.
>gcc-6-plugin-dev-sh4-linux-gnu - Files for GNU GCC plugin development.
>gcc-6-plugin-dev-sparc64-linux-gnu - Files for GNU GCC plugin development.
>gcc-7-plugin-dev - Files for GNU GCC plugin development.
>
># apt-cache search gcc-4.8
>gcc-4.8-base - GCC, the GNU Compiler Collection (base package)
>libgcc-4.8-dev - GCC support library (development files)
>gcc-4.8 - GNU C compiler
>
>
>Let me see if I can find it on the intar-tubes someplace..

--===============3800109735703543727==--

