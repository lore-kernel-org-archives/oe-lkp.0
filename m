Content-Type: multipart/mixed; boundary="===============2079049226612749673=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Wed, 11 Mar 2020 08:21:49 +1100
Message-ID: <875zfbvrbm.fsf@notabene.neil.brown.name>
In-Reply-To: <c4ef31a663fbf7a3de349696e9f00f2f5c4ec89a.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2079049226612749673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10 2020, Jeff Layton wrote:

>> @@ -735,11 +723,13 @@ static void __locks_wake_up_blocks(struct file_loc=
k *blocker)
>>  =

>>  		waiter =3D list_first_entry(&blocker->fl_blocked_requests,
>>  					  struct file_lock, fl_blocked_member);
>> -		__locks_delete_block(waiter);
>> +		locks_delete_global_blocked(waiter);
>> +		waiter->fl_blocker =3D NULL;
>>  		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
>>  			waiter->fl_lmops->lm_notify(waiter);
>>  		else
>>  			wake_up(&waiter->fl_wait);
>> +		list_del_init(&waiter->fl_blocked_member);
>
> Are you sure you don't need a memory barrier here? Could the
> list_del_init be hoisted just above the if condition?
>

A compiler barrier() is probably justified.  Memory barriers delay reads
and expedite writes so they cannot be needed.

 			wake_up(&waiter->fl_wait);
+		/* The list_del_init() must not be visible before the
+		 * wake_up completes, the the waiter can then be freed.
+		 */
+		barrier();
+		list_del_init(&waiter->fl_blocked_member);

Thanks,
NeilBrown

--===============2079049226612749673==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWw1b0JPMEFDZ2tRT2V5ZTNWWmkKZ2Jsd3FRLzhEa29aSnlqdWlw
L2lvZU5WNFJKUnJlQmx2Y2tWWnZoTVdlZ0FFY1d0aVZkNWNJeHd3ejhSNEMvUQpXanFweXh3OWcy
anpsaGJ3TmZqUXdnUXFWeVdwcEdyempoV2xJREQ1SnM2bkU4QktUQkZ0YVdwY0ZzZlo2Q1grCnhp
ZUZvWDBESVZBcXFxSlpQWTJHYUpaMTFQVXRKTUhtcisvbkR6MklkUU5FY1p1dTM0VjF6K2tURnpZ
eVhldm0KNGxFeS84ZTVjMTYvbFJJRDBmQjRrazNSa2NyTTNETW52T05FeHBXMmpxSzBNckRNb1Rr
eGJMaGh0TUtPTmowagpxRFlDZTdzVjcraDlkeEdBNVdGV3h2YnQ2bDRuNmVwbk5hNXBLcWloTHRG
cWk4NWpHVHlnYmNhM1Y4VzhZRE02Cmluclg5TCtFZHV1SzBWQlAyMXNXYzBrMVlaVEYzeEN0K3VW
VExNL3FST2V2a3hpdkQ2dldDQjJYZEFxTmJub2oKcmF4RXoxNUdFb01xQVVsYVBRNzNocHZNZmVB
YWVYVkVtOWdzZ3A3TGp6b3lRekw3RjZyazV4US9jY1JvNGNLMgp6RW9HbkF0OWtYUXBvYlNmam5P
RUxvRmJ6RUZzaFN4endRdUV6bWVoOGZlN3o4NHFqTVZCbDJrSk9jTDJYSjBOCmR2MmppeUc0NkRQ
bDFBTG05RUFWdjRxbGN3bU9lNHZrbHEwODdTVFdnR2JBSlRsemorUTZTYXlYeU9Bd2R6SysKUlJ4
eXZqRWNQZlMweGl2cEUybDBGa1UvempjZytBMUhrU0c5NEtQRVA0eGpMYWxmZXZVNjhIM0JvU0Nm
dUdyMgpQdWVlY1dDSWFtZkQ5blZ1blVxeWF3WFd4ZFBJU1VLTnJncTFzcVEySjhleG5wVXFNSVU9
Cj1aSHRrCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============2079049226612749673==--

