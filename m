Content-Type: multipart/mixed; boundary="===============3749236964216585395=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/2] signal: Don't always set SA_IMMUTABLE for forced signals
Date: Fri, 19 Nov 2021 09:08:39 -0600
Message-ID: <87k0h4p4i0.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <202111181553.A4FDEB1@keescook>
List-Id: <oe-lkp.lists.linux.dev>

--===============3749236964216585395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kees Cook <keescook@chromium.org> writes:

> On Thu, Nov 18, 2021 at 04:04:58PM -0600, Eric W. Biederman wrote:
>> diff --git a/kernel/signal.c b/kernel/signal.c
>> index 7c4b7ae714d4..02058c983bd6 100644
>> --- a/kernel/signal.c
>> +++ b/kernel/signal.c
>> @@ -1298,6 +1298,12 @@ int do_send_sig_info(int sig, struct kernel_sigin=
fo *info, struct task_struct *p
>>  	return ret;
>>  }
>>  =

>> +enum sig_handler {
>> +	HANDLER_CURRENT, /* If reachable use the current handler */
>> +	HANDLER_SIG_DFL, /* Always use SIG_DFL handler semantics */
>> +	HANDLER_EXIT,	 /* Only visible as the proces exit code */
>
> Oh, I just noticed this typo "proces" -> "process"

Fixed.  Thank you.

Eric
--===============3749236964216585395==--

