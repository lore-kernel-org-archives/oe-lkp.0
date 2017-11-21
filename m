Content-Type: multipart/mixed; boundary="===============2795799121617138480=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86] 7b1f0050e4 PANIC: double fault, error_code: 0x0
Date: Tue, 21 Nov 2017 21:36:04 +0800
Message-ID: <20171121133604.kzxbjtscfjdn4zps@wfg-t540p.sh.intel.com>
In-Reply-To: <B494B6DF-0CA0-4D14-AAF8-683813E3246B@amacapital.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2795799121617138480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 06:33:13AM -0700, Andy Lutomirski wrote:
>
>
>> On Nov 21, 2017, at 3:19 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
>>
>> Hi Andy,
>>
>> FYI, this error looks still active in branch HEAD:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry=
_stack.wip
>>
>
>Hmm, I thought I deleted that branch.  Now it's just x86/entry_stack.

Ah, we don't detect branch deletion. So it should be fine now. :)

Regards,
Fengguang

--===============2795799121617138480==--

