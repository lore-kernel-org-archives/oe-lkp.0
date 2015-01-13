Content-Type: multipart/mixed; boundary="===============3028752010235387930=="
MIME-Version: 1.0
From: Cong Wang <cwang@twopensource.com>
To: lkp@lists.01.org
Subject: Re: Fwd: [rhashtable] WARNING: CPU: 0 PID: 10 at kernel/locking/mutex.c:570 mutex_lock_nested()
Date: Tue, 13 Jan 2015 11:14:33 -0800
Message-ID: <CAHA+R7M1ZSCF+FwKVtZUbsJ05zesNg-WVTqH13=oFe5gM--3gw@mail.gmail.com>
In-Reply-To: <20150113084126.GE20387@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3028752010235387930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 12:41 AM, Thomas Graf <tgraf@suug.ch> wrote:
> On 01/13/15 at 03:50pm, Ying Xue wrote:
>> On 01/12/2015 08:42 PM, Thomas Graf wrote:
>> > On 01/12/15 at 09:38am, Ying Xue wrote:
>> >> Hi Thomas,
>> >>
>> >> I am really unable to see where is wrong leading to below warning
>> >> complaints. Can you please help me check it?
>> >
>> > Not sure yet. It's not your patch that introduced the issue though.
>> > It merely exposed the affected code path.
>> >
>> > Just wondering, did you test with CONFIG_DEBUG_MUTEXES enabled?
>> >
>> >
>>
>> After I enable above option, I don't find similar complaints during my
>> testing.
>
> I can't reproduce it in my KVM box either so far. It looks like a
> mutex_lock() on an uninitialized mutex or use after free but I can't
> find such a code path so far.

Couldn't that be the delayed work is still running after rhashtable
is destroyed by its caller? I mean, cancel_delayed_work_sync()
should be called in rhashtable_destroy()?

Of course, it may be caller's responsibility to ensure that, I haven't
looked into it that much.

--===============3028752010235387930==--

