Content-Type: multipart/mixed; boundary="===============1185327466742197476=="
MIME-Version: 1.0
From: Fengguang Wu <wfg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: ed74ae0342 ("blk-mq: Avoid that a completion can be ignored .."): BUG: kernel hang in test stage
Date: Sun, 29 Apr 2018 10:01:17 +0800
Message-ID: <20180429020117.jv2dmvsuetkfqn6l@wfg-t540p.sh.intel.com>
In-Reply-To: <07256b82-12b1-9ccf-c660-9dfbedfd3cac@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1185327466742197476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, Apr 27, 2018 at 06:52:58PM -0600, Jens Axboe wrote:
>On 4/24/18 3:00 PM, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git fo=
r-linus
>>
>> commit ed74ae03424684a6ad8a973c3fa727c6b4162432
>> Author:     Bart Van Assche <bart.vanassche@wdc.com>
>> AuthorDate: Thu Apr 19 09:43:53 2018 -0700
>> Commit:     Jens Axboe <axboe@kernel.dk>
>> CommitDate: Thu Apr 19 14:21:47 2018 -0600
>>
>>     blk-mq: Avoid that a completion can be ignored for BLK_EH_RESET_TIMER

>Any chance you can try with the newer version?
>
>https://github.com/bvanassche/linux/commit/4acd555fa13087

That works!

Tested-by: Fengguang Wu <fengguang.wu@intel.com>

--===============1185327466742197476==--

