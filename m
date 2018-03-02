Content-Type: multipart/mixed; boundary="===============6733506570727303181=="
MIME-Version: 1.0
From: kemi <kemi.wang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [iversion] c0cef30e4f: aim7.jobs-per-min -18.0% regression
Date: Fri, 02 Mar 2018 13:54:29 +0800
Message-ID: <7f1b2159-edc0-57de-eed0-f544d638e8c0@intel.com>
In-Reply-To: <CA+55aFx+oUB_H4KFTkuT+goMRABkjbdS211Zy2fG96RHuqbhBA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6733506570727303181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2018=E5=B9=B402=E6=9C=8828=E6=97=A5 01:04, Linus Torvalds wrote:
> On Tue, Feb 27, 2018 at 5:43 AM, David Howells <dhowells@redhat.com> wr=
ote:
>> Is it possible there's a stall between the load of RCX and the subsequent
>> instructions because they all have to wait for RCX to become available?
> =

> No. Modern Intel big-core CPU's simply aren't that fragile. All these
> instructions should do OoO fine for trivial sequences like this, and
> as far as I can tell, the new code sequence should be better.
> =

> And even if it were worse for some odd reason, it would be worse by a cyc=
le.
> =

> This kind of 18% change is something else, it is definitely not about
> instruction scheduling.
> =

> Now, if the change to inode_cmp_iversion() causes some actual
> _behavioral_ changes, and we get more IO, that's more like it. But the
> code really does seem to be equivalent. In both cases it is simply
> comparing 63 bits: the high 63 bits of 0x150(%rbp) - inode->i_version
> - with the low 63 bits of 0x20(%rax) - iint->version.
> =

> The only issue would be if the high bit of 0x20(%rax) was somehow set.
> The new code doesn't shift that bit away an more, but it should never
> be set since it comes from
> =

>         i_version =3D inode_query_iversion(inode);
> ...
>         iint->version =3D i_version;
> =

> and that inode_query_iversion() will have done the version shift.
> =

>> The interleaving between operating on RSI and RCX in the older code might
>> alleviate that.
>>
>> In addition, the load if the 20(%rax) value is now done in the CMP instr=
uction
>> rather than earlier, so it might not get speculatively loaded in time, w=
hereas
>> the earlier code explicitly loads it up front.
> =

> No again, OoO cores will generally hide details like that.
> =

> You can see effects of it, but it's hard, and it can go both ways.
> =

> Anyway, I think the _real_ change has nothing to with instruction
> scheduling, and everything to do with this:
> =

>     107.62 =C2=B1 37%    +139.1%     257.38 =C2=B1 16%  vmstat.io.bo
>      48740 =C2=B1 36%    +191.4%     142047 =C2=B1 16%  proc-vmstat.pgpgo=
ut
> =

> (There's fairly big variation in those numbers, but the changes are
> even bigger) or this:
> =

>     258.12          -100.0%       0.00        turbostat.Avg_MHz
>      21.48           -21.5        0.00        turbostat.Busy%
> =


This is caused by a limitation in current turbostat parse script of lkp. It =

treats a string including wildcard character (e.g. 30.**) in the output of =
turbostat
monitor as an error and set all the stats value as 0.

Turbostat monitor runs successfully during these tests.

> or this:
> =

>      27397 =C2=B1194%  +43598.3%   11972338 =C2=B1139%
> latency_stats.max.io_schedule.nfs_lock_and_join_requests.nfs_updatepage.n=
fs_write_end.generic_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS=
_write.entry_SYSCALL_64_fastpath
>      27942 =C2=B1189%  +96489.5%   26989044 =C2=B1139%
> latency_stats.sum.io_schedule.nfs_lock_and_join_requests.nfs_updatepage.n=
fs_write_end.generic_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS=
_write.entry_SYSCALL_64_fastpath
> =

> but those all sound like something changed in the setup, not in the kerne=
l.
> =

> Odd.
> =

>             Linus
>=20

--===============6733506570727303181==--

