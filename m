Content-Type: multipart/mixed; boundary="===============6547067592788395180=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [list] 8052ce2d97: WARNING: CPU: 0 PID: 1 at lib/list_debug.c:60 __list_del_entry+0x4d/0x71
Date: Thu, 08 Sep 2016 08:52:33 -0700
Message-ID: <CAGXu5jLU6z5O7coEfu7ZA_xMguvT0n28iendhGyybUULSSkNAg@mail.gmail.com>
In-Reply-To: <20160908092712.GI3663@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6547067592788395180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2016 at 2:27 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Wed, Sep 07, 2016 at 10:25:58AM -0700, Kees Cook wrote:
>> On Wed, Sep 7, 2016 at 12:31 AM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Tue, Sep 06, 2016 at 11:49:04AM -0400, Kees Cook wrote:
>> >> On Sun, Sep 4, 2016 at 5:48 AM, Paul E. McKenney
>> >> <paulmck@linux.vnet.ibm.com> wrote:
>> >> > On Sun, Sep 04, 2016 at 08:35:40AM +0800, kernel test robot wrote:
>> >> >>
>> >> >> FYI, we noticed the following commit:
>> >> >>
>> >> >> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.=
git dev.2016.08.19a
>> >> >> commit 8052ce2d9771ab5a818307f3abbaf33bba82a631 ("list: Split list=
_add() debug checking into separate function")
>> >> >>
>> >> >> in testcase: boot
>> >> >>
>> >> >> on test machine: qemu-system-i386 -enable-kvm -m 360M
>> >> >>
>> >> >> caused below changes:
>> >> >
>> >> > Hello, Kees,
>> >> >
>> >> > Looks like your change might have actually found a bug.  ;-)
>> >> >
>> >> > How would you like to handle this?
>> >>
>> >> We should fix the bug! :)
>> >
>> > But of course...
>> >
>> > The question is whether I am considered to be fully responsible for
>> > chasing down any bugs that arise.  It is looking like I am, in which
>> > case I must defer this patch to the 4.10 merge window.  Things are a
>> > bit crazy now due to prior overcommitments...
>>
>> I'm going to double-check the code, but the changes I made shouldn't
>> have changed any of the logical checks under CONFIG_DEBUG_LIST... just
>> the manifestation of WARN vs BUG. So, since both this and the BPF RCU
>> bug have appeared, something has changed... I will go digging...
>
> So maybe the boot failures are a result of the WARN->BUG transition?
>
>> >> >> [  152.698509] ------------[ cut here ]------------
>> >> >> [  152.709786] WARNING: CPU: 0 PID: 1 at lib/list_debug.c:60 __lis=
t_del_entry+0x4d/0x71
>> >> >> [  152.722785] list_del corruption. next->prev should be cc0230d4,=
 but was 6b6b6b6b
>> >>
>> >> That's the poison value, so this is a remove-after-remove bug?

Unfortunately, the 0-day backtrace shows WARN :(

-Kees

-- =

Kees Cook
Nexus Security

--===============6547067592788395180==--

