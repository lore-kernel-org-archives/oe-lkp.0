Content-Type: multipart/mixed; boundary="===============9098356733683321027=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: kthread_bind fails to enforce CPU affinity (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Sun, 07 Dec 2014 20:28:34 -0800
Message-ID: <CA+55aFw6gMN5VxONPo9xtJA_+p2iLArSaK-m_4vDL+L07Z6vuA@mail.gmail.com>
In-Reply-To: <1418009221-12719-1-git-send-email-anton@samba.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9098356733683321027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 7, 2014 at 7:27 PM, Anton Blanchard <anton@samba.org> wrote:
>
> Since we cannot call set_task_cpu (the task is in a sleeping state),
> just do an explicit set of task_thread_info(p)->cpu.

Scheduler people: is this sufficient and ok?

The __set_task_cpu() function does various other things too:

        set_task_rq(p, cpu);
  #ifdef CONFIG_SMP
        /*
         * After ->cpu is set up to a new value, task_rq_lock(p, ...) can be
         * successfuly executed on another CPU. We must ensure that updates=
 of
         * per-task data have been completed by this moment.
         */
        smp_wmb();
        task_thread_info(p)->cpu =3D cpu;
        p->wake_cpu =3D cpu;
  #endif

which makes me worry about just setting the thread_info->cpu value.
That set_task_rq() initializes various group scheduling things, an
dthat whole "wake_cpu" thing seems relevant too.

I'm not saying the patch is wrong, I just want confirmation/ack for
it. Although to be honest, I'd rather see this come in through the
scheduler tree anyway.

Hmm? This seems to go back to 2.6.33 if that "Fixes" line is accurate,
so it's been around forever (almost exactly five years). Comments?

                    Linus

--===============9098356733683321027==--

