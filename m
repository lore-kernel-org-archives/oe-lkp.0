Content-Type: multipart/mixed; boundary="===============7250411870378696050=="
MIME-Version: 1.0
From: Jim Davis <jim.epost@gmail.com>
To: lkp@lists.01.org
Subject: Re: Testing for POSIX shell compliance?
Date: Tue, 26 Jul 2016 20:49:58 -0700
Message-ID: <CA+r1ZhiKsRtepUMgmu4j+GRkzwvjCJ9jR-jGdRWLOt7ZZ9oxAQ@mail.gmail.com>
In-Reply-To: <20160727034154.GA22290@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7250411870378696050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 8:41 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hi Jim,
>
> On Tue, Jul 26, 2016 at 08:37:28PM -0700, Jim Davis wrote:
>>
>> Hi -- while looking into a problem building the Linux kernel using the
>> dash shell, I was given to understand that any POSIX-compliant shell
>> should work, and Bash-specific features should be avoided in kernel
>> shell scripts.  Does -- or could -- the 0-day tests include builds
>> with non-Bash shells like dash or posh to check for Bash-isms?
>
>
> Sure. Will it be enough to symlink /bin/sh to dash?

Great --  I've been setting CONFIG_SHELL=3D/bin/dash, but I'd think
symlinking should be fine (unless dash does something odd with
argv[0], and I don't see any indication of that in the man page).

-- =

Jim

--===============7250411870378696050==--

