Content-Type: multipart/mixed; boundary="===============5770372957368699787=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] f9ce0be71d: BUG:KCSAN:data-race_in_next_uptodate_page/next_uptodate_page
Date: Tue, 31 Aug 2021 15:38:17 +0200
Message-ID: <CANpmjNOEstBLc9tbofcM=hfkYsmQFLBzq3i=L58fPpgg1vHgPw@mail.gmail.com>
In-Reply-To: <20210831131313.GC31712@willie-the-truck>
List-Id: <oe-lkp.lists.linux.dev>

--===============5770372957368699787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Aug 2021 at 15:13, Will Deacon <will@kernel.org> wrote:
[...]
> > > +--------------------------------------------------------------------=
----+-----------+------------+
> > > |                                                                    =
    | v5.11-rc4 | f9ce0be71d |
> > > +--------------------------------------------------------------------=
----+-----------+------------+
> > > | BUG:KCSAN:data-race_in_next_uptodate_page/next_uptodate_page       =
    | 0         | 19         |
> > > | BUG:KCSAN:data-race_in_mark_page_accessed/next_uptodate_page       =
    | 0         | 17         |
> > > | BUG:KCSAN:data-race_in_next_uptodate_page/page_memcg               =
    | 0         | 13         |
> > > | BUG:KCSAN:data-race_in_next_uptodate_page/unlock_page              =
    | 0         | 13         |
> > > +--------------------------------------------------------------------=
----+-----------+------------+
> > >
> > > [  184.717904][ T1873] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > [  184.718938][ T1873] BUG: KCSAN: data-race in next_uptodate_page / =
unlock_page
> > > [  184.719828][ T1873]
> > > [  184.720103][ T1873] write (marked) to 0xffffea00050f37c0 of 8 byte=
s by task 1872 on cpu 1:
> > > [  184.721024][ T1873]  unlock_page+0x102/0x1b0
> > > [  184.721533][ T1873]  filemap_map_pages+0x6c6/0x890
> > > [  184.722102][ T1873]  handle_mm_fault+0x179c/0x27f0
> > > [  184.722672][ T1873]  do_user_addr_fault+0x3fb/0x830
> > > [  184.723263][ T1873]  exc_page_fault+0xc3/0x1a0
> > > [  184.723845][ T1873]  asm_exc_page_fault+0x1e/0x30
> > > [  184.724427][ T1873]
> > > [  184.724720][ T1873] read to 0xffffea00050f37c0 of 8 bytes by task =
1873 on cpu 0:
> > > [  184.725575][ T1873]  next_uptodate_page+0x456/0x830
> > > [  184.726161][ T1873]  filemap_map_pages+0x728/0x890
> > > [  184.726747][ T1873]  handle_mm_fault+0x179c/0x27f0
> > > [  184.727332][ T1873]  do_user_addr_fault+0x3fb/0x830
> > > [  184.727905][ T1873]  exc_page_fault+0xc3/0x1a0
> > > [  184.728440][ T1873]  asm_exc_page_fault+0x1e/0x30
> > > [  184.729027][ T1873]
> > > [  184.729313][ T1873] Reported by Kernel Concurrency Sanitizer on:
> > > [  184.730019][ T1873] CPU: 0 PID: 1873 Comm: systemd-udevd Not taint=
ed 5.11.0-rc4-00001-gf9ce0be71d1f #1
> > > [  184.731103][ T1873] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >
> > Line annotation would be helpful.
>
> Agreed.
>
> > And I'm not very familiar with KCSAN. My guess it reports PageLock() vs.
> > clearing PG_locked. In this context it looks safe, unless I miss
> > something.
>
> The access in clear_bit_unlock() is annotated as a full sizeof(long) atom=
ic
> write, so we could be racing with a non-atomic read of another bit in the
> page flags but I can't spot where that happens before the trylock_page() =
in
> next_uptodate_page().
>
> > Do we need some annotation to help KCSAN?
>
> clear_bit_unlock() is already instrumented and _most_ of the helpers in
> page-flags.h look they should be as well by virtue of using test_bit().

Even though they're data races, if this is a "1-bit value change" data
race, then I'd leave it as-is for now (unless maintainer prefers
marking everything that can concurrently be accessed).

Bots wanting to enable KCSAN and races like this was the reason for
CONFIG_KCSAN_PERMISSIVE (ignoring those "1-bit value changes"):
https://lkml.kernel.org/r/20210607125653.1388091-1-elver(a)google.com --
This series is supposed to land in this merge-window.

For syzbot, we do active moderation -- when we get the time, we look
at races, and try to analyze or fix (although I've not looked
recently), or unconditionally forward to some maintainers who
committed addressing all data races in their subsystems (RCU, some
parts of networking).

Without active moderation before kernel 5.15, I do not recommend
turning on KCSAN on bots unconditionally, simply because prioritizing
the severity of data races is still difficult (and maintainers only
have so much time). Ultimately, our goal is of course to eventually
address all data races, but I think it requires time and patience.

With 5.15, it may be possible to cautiously enable KCSAN on bots
without moderation if they set CONFIG_KCSAN_PERMISSIVE=3Dy. If no
moderation is possible, an intermediate step may be:

-- sending everything to a separate mailing list by default, without
Cc (those interested, can subscribe)
-- maintainers who opt into KCSAN reports will get the reports as normal.

We could also make use of those opt-ins for syzbot. :-)

Thoughts?

(For completeness, longer discussion on developer/maintainer
strategies: https://lwn.net/Articles/816854/)

Thanks,
-- Marco
--===============5770372957368699787==--

