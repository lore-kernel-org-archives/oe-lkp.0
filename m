Content-Type: multipart/mixed; boundary="===============7605618239873672227=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [loop] 51d5ae114d: blktests.loop/006.fail
Date: Thu, 25 Nov 2021 19:26:31 +0800
Message-ID: <0ecb61b2-3705-3abc-6e55-ea6933c48325@intel.com>
In-Reply-To: <f7af7250-66f0-0d77-deee-c67edc1569fd@i-love.sakura.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============7605618239873672227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


on 2021/11/25 17:55, Tetsuo Handa wrote:
> Hello.
>
> On 2021/11/25 15:19, kernel test robot wrote:
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          sudo bin/lkp install job.yaml           # job file is attached =
in this email
>>          bin/lkp split-job --compatible job.yaml # generate the yaml fil=
e for lkp run
>>          sudo bin/lkp run generated-yaml-file
>>
>>          # if come across any failure that blocks the test,
>>          # please remove ~/.lkp and /lkp dir to run from a clean state.
> On Ubuntu 21.10, I can't complete
>
>    bin/lkp install job.yaml
>
> due to the following error.
>
> ----------
> HEAD is now at 642d426f Release 1.6
> cc -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -O2 -g -Wall -W=
error -std=3Dgnu99 -DNVME_VERSION=3D'"1.6"' -c argconfig.c
> cc -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -O2 -g -Wall -W=
error -std=3Dgnu99 -DNVME_VERSION=3D'"1.6"' -c suffix.c
> cc -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -O2 -g -Wall -W=
error -std=3Dgnu99 -DNVME_VERSION=3D'"1.6"' -c parser.c
> cc -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -O2 -g -Wall -W=
error -std=3Dgnu99 -DNVME_VERSION=3D'"1.6"' -c nvme-print.c
> cc -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -O2 -g -Wall -W=
error -std=3Dgnu99 -DNVME_VERSION=3D'"1.6"' -c nvme-ioctl.c
> cc -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -O2 -g -Wall -W=
error -std=3Dgnu99 -DNVME_VERSION=3D'"1.6"' -c nvme-lightnvm.c
> cc -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D__CHECK_ENDIAN__ -O2 -g -Wall -W=
error -std=3Dgnu99 -DNVME_VERSION=3D'"1.6"' -c fabrics.c
> In file included from /usr/include/x86_64-linux-gnu/sys/types.h:176,
>                   from /usr/include/stdlib.h:394,
>                   from fabrics.c:24:
> fabrics.c: In function =E2=80=98do_discover=E2=80=99:
> fabrics.c:315:34: error: array subscript =E2=80=98struct nvmf_disc_rsp_pa=
ge_hdr[0]=E2=80=99 is partly outside array bounds of =E2=80=98unsigned char=
[16]=E2=80=99 [-Werror=3Darray-bounds]
>    315 |         *numrec =3D le64_to_cpu(log->numrec);
> fabrics.c:315:19: note: in expansion of macro =E2=80=98le64_to_cpu=E2=80=
=99
>    315 |         *numrec =3D le64_to_cpu(log->numrec);
>        |                   ^~~~~~~~~~~
> fabrics.c:302:15: note: referencing an object of size 16 allocated by =E2=
=80=98calloc=E2=80=99
>    302 |         log =3D calloc(1, log_size);
>        |               ^~~~~~~~~~~~~~~~~~~
> In file included from /usr/include/x86_64-linux-gnu/sys/types.h:176,
>                   from /usr/include/stdlib.h:394,
>                   from fabrics.c:24:
> fabrics.c:316:33: error: array subscript =E2=80=98struct nvmf_disc_rsp_pa=
ge_hdr[0]=E2=80=99 is partly outside array bounds of =E2=80=98unsigned char=
[16]=E2=80=99 [-Werror=3Darray-bounds]
>    316 |         genctr =3D le64_to_cpu(log->genctr);
> fabrics.c:316:18: note: in expansion of macro =E2=80=98le64_to_cpu=E2=80=
=99
>    316 |         genctr =3D le64_to_cpu(log->genctr);
>        |                  ^~~~~~~~~~~
> fabrics.c:302:15: note: referencing an object of size 16 allocated by =E2=
=80=98calloc=E2=80=99
>    302 |         log =3D calloc(1, log_size);
>        |               ^~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make: *** [Makefile:46: fabrics.o] Error 1
> =3D=3D> ERROR: A failure occurred in package().
>      Aborting...
> Install blktests failed
> ----------
>
> I tried
>
>    export CFLAGS=3D'-O2 -g -Wall -Werror -Wno-error=3Darray-bounds'

You might need to pass extra CFLAGS in pkg/blktests/PKGBUILD where it =

builds the tests.


>
> before
>
>    bin/lkp install job.yaml
>
> but environment variable is not inherited till fabrics.c . Also
> editing Makefile does not help because files are overwritten.
> I don't know how to make it possible to complete.
>
> Can you provide the files related to

It could relate to below test

https://github.com/osandov/blktests/blob/master/tests/loop/006


Thanks

Zhijian


>
>>       Running loop/006
>>      +losetup: /dev/loop0: failed to set up loop device: Invalid argument
>>       Test complete
> line so that I can understand what this testcase is trying to do ?
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============7605618239873672227==--

