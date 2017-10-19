Content-Type: multipart/mixed; boundary="===============5959294697912987269=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] c4c3c3c2d0: will-it-scale.per_process_ops -61.0% regression
Date: Thu, 19 Oct 2017 13:57:25 +0800
Message-ID: <20171019055725.GA22668@yexl-desktop>
In-Reply-To: <20171018081109.mj6lzzihxmlle3b6@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============5959294697912987269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, ying

On 10/18, Borislav Petkov wrote:
>On Wed, Oct 18, 2017 at 09:59:02AM +0800, Ye Xiaolong wrote:
>> 2017-10-14 23:43:02 ./runtest.py context_switch1 295 process 44
>> tasks,processes,processes_idle,threads,threads_idle,linear
>> 0,0,100,0,100,0
>> 44,7723745,22.45,0,0.00,0
>> =

>> per_process_ops =3D 7723745 / 44 =3D 175540
>
>What is that 7723745 value? 44 too?
>
>Please explain it in plain english and not in the context of some script
>you're running. Just assume I don't know *anything* about will-it-scale.
>How would you explain what those numbers are, to me?

Could you suggest better wording to describe the meaning of metric "will-it=
-scale.per_process_ops"?

Thanks,
Xiaolong

>
>And then consider adding boilerplate text to your reports *explaining*
>what you're measuring because as it is now, people are left wondering
>WTF is going on.
>
>> percent -61% is computed by (174892 - 448554) / 448554
>
>Ok, that I understand.
>
>Thx.
>
>-- =

>Regards/Gruss,
>    Boris.
>
>Good mailing practices for 400: avoid top-posting and trim the reply.

--===============5959294697912987269==--

