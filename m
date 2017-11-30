Content-Type: multipart/mixed; boundary="===============6777666700419171520=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [btrfs_mount] general protection fault: 0000 [#1] SMP
Date: Thu, 30 Nov 2017 12:30:09 +0800
Message-ID: <20171130043009.qoetvxeokkbqyvsx@wfg-t540p.sh.intel.com>
In-Reply-To: <CA+55aFzOgPOV+UZu6jCJMrbxOSBvn1UdxC5phAwC7n8n4asR5w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6777666700419171520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2017 at 06:44:43PM -0800, Linus Torvalds wrote:
>On Wed, Nov 29, 2017 at 6:38 PM, Nick Terrell <terrelln@fb.com> wrote:
>>
>> The stack trace looks like the bug fixed by
>>
>> Qu Wenruo:
>>     btrfs: Fix wild memory access in compression level parser [1]
>>
>> That fix looks to be included in the pull request for 4.15-rc2 [2].
>
>Which got merged earlier today. So maybe instead of a bisection, just
>test the current git tree?

Sure. The 1 hour tests finished on your latest merge and the error
no long shows up there.

Regards,
Fengguang

--===============6777666700419171520==--

