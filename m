Content-Type: multipart/mixed; boundary="===============3328887697584670152=="
MIME-Version: 1.0
From: Alexander Potapenko <glider@google.com>
To: lkp@lists.01.org
Subject: Re: [ 53.230885] RIP: 0010:[<ffffffff811b3557>] [<ffffffff811b3557>] qlink_free
Date: Mon, 01 Aug 2016 16:02:10 +0200
Message-ID: <CAG_fn=UqZeD7AQgJW4eS57upm9hkLRMgUE4Q3gnQjq6rKu7pvg@mail.gmail.com>
In-Reply-To: <20160801135947.GA24942@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3328887697584670152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 1, 2016 at 3:59 PM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> Hi Alexander,
>
>> When I build the kernel with your config and run the script, QEMU
>> bails out with an error message:
>>  qemu: linux kernel too old to load a ram disk
>> Any idea how to work around that?
>
>
> Yes this config may not include necessary parts. I cannot enter initrd
> this way:
>
> [    3.079656] Failed to execute /init (error -8)
> [    3.082079] Starting init: /sbin/init exists but couldn't execute it
> (error -8)
> [    3.084836] Starting init: /etc/init exists but couldn't execute it
> (error -13)
> [    3.088568] Starting init: /bin/sh exists but couldn't execute it (err=
or
> -8)
> [    3.090560] Kernel panic - not syncing: No working init found.  Try
> passing init=3D option to kernel. See Linux Documentation/init.txt for
> guidance.
>
> What's worse, the bug on RIP qlink_free() is only 20% reproducible
> in one old boot server. I cannot reproduce that problem in other
> more modern machines.
>
> Feel free to ignore it if cannnot find the root cause in call trace.
Another request: may I ask you to run the log through
https://github.com/google/sanitizers/blob/master/address-sanitizer/tools/ka=
san_symbolize.py
?
That may sched some light on what's going on (at least give a more
readable stack)
> Thanks,
> Fengguang



-- =

Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Matthew Scott Sucherman, Paul Terence Manicle
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

--===============3328887697584670152==--

