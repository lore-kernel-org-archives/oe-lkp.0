Content-Type: multipart/mixed; boundary="===============8695533834828187884=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/vsyscall] 3dc33bd30f Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Tue, 21 Feb 2017 21:34:53 -0800
Message-ID: <CAGXu5jLfR=zoxmBMZKOrTKRQV1e+hgqiKWCaDedMs9nNkb39yg@mail.gmail.com>
In-Reply-To: <CALCETrWpxjKg8VrwKa3nmFVYc6EDBQeENgix0mpz5e_X6xbQig@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8695533834828187884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 9:23 PM, Andy Lutomirski <luto@amacapital.net> wr=
ote:
> On Tue, Feb 21, 2017 at 4:46 PM, Kees Cook <keescook@chromium.org> wrot=
e:
>> On Tue, Feb 21, 2017 at 4:39 PM, Chunyu Hu <chuhu.ncepu@gmail.com> wro=
te:
>>> I hit the similar panic on Fedora 25. Is it the same issue?
>>>
>>>
>>> [    2.527391] Freeing unused kernel memory: 1688K (ffffffffbdf66000 -
>>> ffffffffbe10c000)
>>> [    2.535222] Write protecting the kernel read-only data: 14336k
>>> [    2.542679] Freeing unused kernel memory: 1892K (ffff94cb30827000 -
>>> ffff94cb30a00000)
>>> [    2.553482] Freeing unused kernel memory: 700K (ffff94cb30d51000 -
>>> ffff94cb30e00000)
>>> [    2.572048] x86/mm: Checked W+X mappings: passed, no W+X pages found.
>>> Fatal: [    2.598239] traps: init[1] general protection ip:7fc841bfc642
>>> sp:7ffc3fd85870 error:0no entropy gathering module dete[    2.606473]  =
in
>>> libc-2.24.so[7fc841bc5000+1bd000]
>>> cted
>>
>> I would not expect a vsyscall table problem if it's truly using glibc
>> 2.24. Maybe something regressed in glibc? That really looks like an
>> attempt to call vsyscalls?
>
> There should be a vsyscall error if so, and shouldn't it be a page
> fault, not a gpf?

Yeah, the earlier email from Fengguang included a vsyscall error, so
I'm not sure what this is, exactly. But if it bisects to the same
commit, we likely need to investigate a bit more.

-Kees

-- =

Kees Cook
Pixel Security

--===============8695533834828187884==--

