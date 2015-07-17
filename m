Content-Type: multipart/mixed; boundary="===============7474877887950224100=="
MIME-Version: 1.0
From: Konstantin Khlebnikov <koct9i@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mminit] [ INFO: possible recursive locking detected ]
Date: Fri, 17 Jul 2015 08:06:49 +0300
Message-ID: <CALYGNiMMeyW7GXHpdAONn4CckE5Q4cn64wwekZfk18q_W7xMsQ@mail.gmail.com>
In-Reply-To: <20150716175139.GB2561@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7474877887950224100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 8:51 PM, Mel Gorman <mgorman@suse.de> wrote:
> On Thu, Jul 16, 2015 at 08:13:38PM +0300, Konstantin Khlebnikov wrote:
>> > @@ -1187,14 +1195,14 @@ void __init page_alloc_init_late(void)
>> >  {pgdat_init_rwsempgdat_init_rwsempgdat_init_rwsem
>> >         int nid;
>> >
>> > +       /* There will be num_node_state(N_MEMORY) threads */
>> > +       atomic_set(&pgdat_init_n_undone, num_node_state(N_MEMORY));
>> >         for_each_node_state(nid, N_MEMORY) {
>> > -               down_read(&pgdat_init_rwsem);
>>
>> Rw-sem have special "non-owner" mode for keeping lockdep away.
>> This should be enough:
>>
>
> I think in this case that the completions look nicer though so I think
> I'll keep them.

Ok. Not a big deal, they are anyway in init sections.

BTW there's another option: wait_on_atomic_t / wake_up_atomic_t
like wait_on_bit but atomic_t

>
> --
> Mel Gorman
> SUSE Labs

--===============7474877887950224100==--

