Content-Type: multipart/mixed; boundary="===============3959772563880231969=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [sched] 817b8ebf33: WARNING: CPU: 0 PID: 2307 at kernel/fork.c:304 free_task+0x2f/0x4c
Date: Fri, 08 Jul 2016 08:26:11 -0700
Message-ID: <CALCETrU+7WzWO4mQD-6qNJMETpsWi6AQN+MepSf2R8B1FeuDRA@mail.gmail.com>
In-Reply-To: <CALCETrXmgraPxaFNh_NAMwGUp2JoKjfSweA5s1S46fPn3UKJwQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3959772563880231969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2016 at 8:04 AM, Andy Lutomirski <luto@amacapital.net> wro=
te:
> On Thu, Jul 7, 2016 at 6:17 PM, kernel test robot <xiaolong.ye@intel.co=
m> wrote:
>>
>>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/vmap_=
stack
>> commit 817b8ebf33c489948ee5db93ab7ed483619a53a5 ("sched: Free the stack =
early if CONFIG_THREAD_INFO_IN_TASK")
>>
>> in testcase: boot
>>
>> on test machine: 1 threads qemu-system-i386 -enable-kvm with 192M memory
>>
>> caused below changes:
>
> I think I've tracked this down to a harmless bug in dup_task_struct
> error handling.  Fixed now.

Correction, copy_process.  I was able to reproduce this, so I'm
reasonable sure I'm right.

-- =

Andy Lutomirski
AMA Capital Management, LLC

--===============3959772563880231969==--

