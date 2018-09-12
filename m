Content-Type: multipart/mixed; boundary="===============3645335392813826300=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 0a3856392c [ 10.513760] INFO: trying to register non-static key.
Date: Wed, 12 Sep 2018 13:04:12 +0800
Message-ID: <283720fb-e9ec-2f2b-660a-ef97d233914f@intel.com>
In-Reply-To: <20180907021937.GA7440@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3645335392813826300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/07/2018 10:19 AM, Matthew Wilcox wrote:
> On Fri, Sep 07, 2018 at 09:05:39AM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> commit 0a3856392cff1542170b5bc37211c9a21fd0c3f6
>> Author:     Matthew Wilcox <willy@infradead.org>
>> AuthorDate: Mon Jun 18 17:23:37 2018 -0400
>> Commit:     Matthew Wilcox <willy@infradead.org>
>> CommitDate: Tue Aug 21 23:54:20 2018 -0400
>>
>>      test_ida: Move ida_check_leaf
>>      =

>>      Convert to new API and move to kernel space.  Take the opportunity =
to
>>      test the situation a little more thoroughly (ie at different offset=
s).
>>      =

>>      Signed-off-by: Matthew Wilcox <willy@infradead.org>
> Thank you test-bot.  Can you check if this patch fixes the problem?
Thanks, It works.

Best Regards,
Rong Chen

>
> diff --git a/lib/test_ida.c b/lib/test_ida.c
> index 2d1637d8136b..b06880625961 100644
> --- a/lib/test_ida.c
> +++ b/lib/test_ida.c
> @@ -150,10 +150,10 @@ static void ida_check_conv(struct ida *ida)
>   	IDA_BUG_ON(ida, !ida_is_empty(ida));
>   }
>   =

> +static DEFINE_IDA(ida);
> +
>   static int ida_checks(void)
>   {
> -	DEFINE_IDA(ida);
> -
>   	IDA_BUG_ON(&ida, !ida_is_empty(&ida));
>   	ida_check_alloc(&ida);
>   	ida_check_destroy(&ida);
>


--===============3645335392813826300==--

