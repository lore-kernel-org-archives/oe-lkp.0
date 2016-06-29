Content-Type: multipart/mixed; boundary="===============3518939543089182014=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: to_live_kthread() needs try_get_task_stack()
Date: Wed, 29 Jun 2016 16:01:19 -0700
Message-ID: <CALCETrWpe5owxR6YupfUQAsTXpVYr6bL3F9jWDxm5Juth-B-UQ@mail.gmail.com>
In-Reply-To: <20160629180357.GA7178@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3518939543089182014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 11:03 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 06/29, Andy Lutomirski wrote:
>>
>> I pushed that change to my tree (seems to work well enough to boot
>> without warnings as long as I don't unmount XFS, but not particularly
>> well tested).  Want to refresh your patch on top?
>
> Please see the trivial fix below. Compile tested, but looks obvious.

I stuck it in my tree in the right place.  Thanks!

>
> Btw, why free_thread_stack() calls vfree() with irqs disabled? Doesn't
> look good and perhaps even wrong; at least vmap_debug_free_range() does
> flush_tlb_kernel_range() and smp_call_function() can deadlock?

Whoops, that's a bug.  Fixed now.

--Andy

--===============3518939543089182014==--

