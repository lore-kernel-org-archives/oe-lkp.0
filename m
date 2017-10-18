Content-Type: multipart/mixed; boundary="===============9123196610498255220=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] c4c3c3c2d0: will-it-scale.per_process_ops -61.0% regression
Date: Wed, 18 Oct 2017 09:59:02 +0800
Message-ID: <20171018015902.GA10466@yexl-desktop>
In-Reply-To: <20171017080037.fmgovp53nbvuukzh@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============9123196610498255220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/17, Borislav Petkov wrote:
>On Tue, Oct 17, 2017 at 06:57:43AM +0200, Markus Trippelsdorf wrote:
>> On 2017.10.16 at 18:06 -0700, Andy Lutomirski wrote:
>> > On Mon, Oct 16, 2017 at 3:15 AM, Borislav Petkov <bp@alien8.de> wrot=
e:
>> > > On Mon, Oct 16, 2017 at 10:39:17AM +0800, kernel test robot wrote:
>> > >>
>> > >> Greeting,
>> > >>
>> > >> FYI, we noticed a -61.0% regression of will-it-scale.per_process_op=
s due to commit:
>> =

>> I think you are reading this wrong:
>> -61.0% regression means 61.0% improvement.
>
>Well, it has this:
>
>5b8809deb4b0a77f  c4c3c3c2d00826c88b5c02c20e
>----------------  --------------------------
>         %stddev      change         %stddev
>             \          |                \
>    448554             -61%     174892        will-it-scale.per_process_ops

Here 448554 is the average value of will-it-scale.per_process_ops for commi=
t 5b8809deb4,
while 174892 is the average value of will-it-scale.per_process_ops for comm=
it c4c3c3c2d0,
metric per_process_ops is calculated through raw output of will-it-scale as=
 below
example.

2017-10-14 23:43:02 ./runtest.py context_switch1 295 process 44
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
44,7723745,22.45,0,0.00,0

per_process_ops =3D 7723745 / 44 =3D 175540

percent -61% is computed by (174892 - 448554) / 448554


Thanks,
Xiaolong

>
>Xiaolong, can you first explain what those numbers mean? And how do you
>compute those 61%?
>
>Thx.
>
>-- =

>Regards/Gruss,
>    Boris.
>
>Good mailing practices for 400: avoid top-posting and trim the reply.

--===============9123196610498255220==--

