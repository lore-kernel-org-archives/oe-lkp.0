Content-Type: multipart/mixed; boundary="===============8795992806682456454=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: Testing for POSIX shell compliance?
Date: Wed, 27 Jul 2016 11:57:35 +0800
Message-ID: <20160727035735.GA26078@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+r1ZhiKsRtepUMgmu4j+GRkzwvjCJ9jR-jGdRWLOt7ZZ9oxAQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8795992806682456454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 08:49:58PM -0700, Jim Davis wrote:
>On Tue, Jul 26, 2016 at 8:41 PM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
>> Hi Jim,
>>
>> On Tue, Jul 26, 2016 at 08:37:28PM -0700, Jim Davis wrote:
>>>
>>> Hi -- while looking into a problem building the Linux kernel using the
>>> dash shell, I was given to understand that any POSIX-compliant shell
>>> should work, and Bash-specific features should be avoided in kernel
>>> shell scripts.  Does -- or could -- the 0-day tests include builds
>>> with non-Bash shells like dash or posh to check for Bash-isms?
>>
>>
>> Sure. Will it be enough to symlink /bin/sh to dash?
>
>Great --  I've been setting CONFIG_SHELL=3D/bin/dash, but I'd think
>symlinking should be fine (unless dash does something odd with
>argv[0], and I don't see any indication of that in the man page).

OK. Done. :)

Thanks,
Fengguang

--===============8795992806682456454==--

