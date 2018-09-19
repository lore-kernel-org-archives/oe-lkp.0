Content-Type: multipart/mixed; boundary="===============7317909195382983478=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [vfree, kvfree] a79ed8bfb2: BUG:sleeping_function_called_from_invalid_context_at_mm/util.c
Date: Wed, 19 Sep 2018 13:07:28 +0800
Message-ID: <7fa0dc06-25bb-9549-e501-042bfc22dd36@intel.com>
In-Reply-To: <7e19e4df-b1a6-29bd-9ae7-0266d50bef1d@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7317909195382983478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Tested-by: kernel test robot <rong.a.chen@intel.com>


On 09/18/2018 05:43 PM, Andrey Ryabinin wrote:
> On 09/18/2018 11:52 AM, kernel test robot wrote:
>
>> [    3.265372] BUG: sleeping function called from invalid context at mm/=
util.c:449
>> [    3.288552] in_atomic(): 0, irqs_disabled(): 0, pid: 142, name: rhash=
table_thra
>> [    3.301548] INFO: lockdep is turned off.
>> [    3.302214] Preemption disabled at:
>> [    3.302221] [<c163e86f>] get_random_u32+0x4f/0x100
>> [    3.327556] CPU: 0 PID: 142 Comm: rhashtable_thra Tainted: G        W=
       T 4.19.0-rc3-00266-ga79ed8bf #656
>> [    3.328540] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.10.2-1 04/01/2014
>> [    3.328540] Call Trace:
>> [    3.328540]  ? dump_stack+0x55/0x7b
>> [    3.328540]  ? get_random_u32+0x4f/0x100
>> [    3.328540]  ? ___might_sleep+0x11d/0x170
>> [    3.328540]  ? kvfree+0x61/0x70
>> [    3.328540]  ? bucket_table_free+0x18/0x80
>> [    3.328540]  ? bucket_table_alloc+0x79/0x160
>> [    3.328540]  ? rhashtable_insert_slow+0x25d/0x2d0
>> [    3.328540]  ? insert_retry+0x1df/0x320
>> [    3.328540]  ? threadfunc+0xa3/0x3fe
>> [    3.328540]  ? kzalloc+0x14/0x14
>> [    3.328540]  ? _raw_spin_unlock_irqrestore+0x30/0x50
>> [    3.328540]  ? kthread+0xd1/0x100
>> [    3.328540]  ? insert_retry+0x320/0x320
>> [    3.328540]  ? kthread_delayed_work_timer_fn+0x80/0x80
>> [    3.328540]  ? ret_from_fork+0x2e/0x38
>
> Seems like we need to drop might_sleep_if() from kvfree().
>
> 	rcu_read_lock()
> 		rhashtable_insert_rehash()
> 			new_tbl =3D bucket_table_alloc(ht, size, GFP_ATOMIC | __GFP_NOWARN);
> 				->kvmalloc();
>
> 		bucket_table_free(new_tbl);
> 			->kvfree()
> 	rcu_read_unlock()
>
> kvmalloc(..., GFP_ATOMIC) simply always kmalloc:
> 	if ((flags & GFP_KERNEL) !=3D GFP_KERNEL)
> 		return kmalloc_node(size, flags, node);
>
> So in the above case, kvfree() always frees kmalloced memory -> and never=
 calls vfree().
>
> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> ---
>   mm/util.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/mm/util.c b/mm/util.c
> index 929ed1795bc1..7f1f165f46af 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -446,8 +446,6 @@ EXPORT_SYMBOL(kvmalloc_node);
>    */
>   void kvfree(const void *addr)
>   {
> -	might_sleep_if(!in_interrupt());
> -
>   	if (is_vmalloc_addr(addr))
>   		vfree(addr);
>   	else


--===============7317909195382983478==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+VGVzdGVkLWJ5OiBrZXJuZWwgdGVzdCBy
b2JvdCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIgogICAgICAgIGhyZWY9Im1haWx0
bzpyb25nLmEuY2hlbkBpbnRlbC5jb20iPiZsdDtyb25nLmEuY2hlbkBpbnRlbC5jb20mZ3Q7PC9h
PgogICAgICA8YnI+CiAgICA8L3A+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1w
cmVmaXgiPk9uIDA5LzE4LzIwMTggMDU6NDMgUE0sIEFuZHJleSBSeWFiaW5pbgogICAgICB3cm90
ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9
Im1pZDo3ZTE5ZTRkZi1iMWE2LTI5YmQtOWFlNy0wMjY2ZDUwYmVmMWRAdmlydHVvenpvLmNvbSI+
CiAgICAgIDxwcmUgd3JhcD0iIj5PbiAwOS8xOC8yMDE4IDExOjUyIEFNLCBrZXJuZWwgdGVzdCBy
b2JvdCB3cm90ZToKCjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAg
ICA8cHJlIHdyYXA9IiI+ClsgICAgMy4yNjUzNzJdIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2Fs
bGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0IG1tL3V0aWwuYzo0NDkKWyAgICAzLjI4ODU1Ml0g
aW5fYXRvbWljKCk6IDAsIGlycXNfZGlzYWJsZWQoKTogMCwgcGlkOiAxNDIsIG5hbWU6IHJoYXNo
dGFibGVfdGhyYQpbICAgIDMuMzAxNTQ4XSBJTkZPOiBsb2NrZGVwIGlzIHR1cm5lZCBvZmYuClsg
ICAgMy4zMDIyMTRdIFByZWVtcHRpb24gZGlzYWJsZWQgYXQ6ClsgICAgMy4zMDIyMjFdIFsmbHQ7
YzE2M2U4NmYmZ3Q7XSBnZXRfcmFuZG9tX3UzMisweDRmLzB4MTAwClsgICAgMy4zMjc1NTZdIENQ
VTogMCBQSUQ6IDE0MiBDb21tOiByaGFzaHRhYmxlX3RocmEgVGFpbnRlZDogRyAgICAgICAgVyAg
ICAgICBUIDQuMTkuMC1yYzMtMDAyNjYtZ2E3OWVkOGJmICM2NTYKWyAgICAzLjMyODU0MF0gSGFy
ZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1Mg
MS4xMC4yLTEgMDQvMDEvMjAxNApbICAgIDMuMzI4NTQwXSBDYWxsIFRyYWNlOgpbICAgIDMuMzI4
NTQwXSAgPyBkdW1wX3N0YWNrKzB4NTUvMHg3YgpbICAgIDMuMzI4NTQwXSAgPyBnZXRfcmFuZG9t
X3UzMisweDRmLzB4MTAwClsgICAgMy4zMjg1NDBdICA/IF9fX21pZ2h0X3NsZWVwKzB4MTFkLzB4
MTcwClsgICAgMy4zMjg1NDBdICA/IGt2ZnJlZSsweDYxLzB4NzAKWyAgICAzLjMyODU0MF0gID8g
YnVja2V0X3RhYmxlX2ZyZWUrMHgxOC8weDgwClsgICAgMy4zMjg1NDBdICA/IGJ1Y2tldF90YWJs
ZV9hbGxvYysweDc5LzB4MTYwClsgICAgMy4zMjg1NDBdICA/IHJoYXNodGFibGVfaW5zZXJ0X3Ns
b3crMHgyNWQvMHgyZDAKWyAgICAzLjMyODU0MF0gID8gaW5zZXJ0X3JldHJ5KzB4MWRmLzB4MzIw
ClsgICAgMy4zMjg1NDBdICA/IHRocmVhZGZ1bmMrMHhhMy8weDNmZQpbICAgIDMuMzI4NTQwXSAg
PyBremFsbG9jKzB4MTQvMHgxNApbICAgIDMuMzI4NTQwXSAgPyBfcmF3X3NwaW5fdW5sb2NrX2ly
cXJlc3RvcmUrMHgzMC8weDUwClsgICAgMy4zMjg1NDBdICA/IGt0aHJlYWQrMHhkMS8weDEwMApb
ICAgIDMuMzI4NTQwXSAgPyBpbnNlcnRfcmV0cnkrMHgzMjAvMHgzMjAKWyAgICAzLjMyODU0MF0g
ID8ga3RocmVhZF9kZWxheWVkX3dvcmtfdGltZXJfZm4rMHg4MC8weDgwClsgICAgMy4zMjg1NDBd
ICA/IHJldF9mcm9tX2ZvcmsrMHgyZS8weDM4CjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAg
ICAgIDxwcmUgd3JhcD0iIj4KClNlZW1zIGxpa2Ugd2UgbmVlZCB0byBkcm9wIG1pZ2h0X3NsZWVw
X2lmKCkgZnJvbSBrdmZyZWUoKS4KCglyY3VfcmVhZF9sb2NrKCkKCQlyaGFzaHRhYmxlX2luc2Vy
dF9yZWhhc2goKQoJCQluZXdfdGJsID0gYnVja2V0X3RhYmxlX2FsbG9jKGh0LCBzaXplLCBHRlBf
QVRPTUlDIHwgX19HRlBfTk9XQVJOKTsKCQkJCS0mZ3Q7a3ZtYWxsb2MoKTsKCgkJYnVja2V0X3Rh
YmxlX2ZyZWUobmV3X3RibCk7CgkJCS0mZ3Q7a3ZmcmVlKCkKCXJjdV9yZWFkX3VubG9jaygpCgpr
dm1hbGxvYyguLi4sIEdGUF9BVE9NSUMpIHNpbXBseSBhbHdheXMga21hbGxvYzoKCWlmICgoZmxh
Z3MgJmFtcDsgR0ZQX0tFUk5FTCkgIT0gR0ZQX0tFUk5FTCkKCQlyZXR1cm4ga21hbGxvY19ub2Rl
KHNpemUsIGZsYWdzLCBub2RlKTsKClNvIGluIHRoZSBhYm92ZSBjYXNlLCBrdmZyZWUoKSBhbHdh
eXMgZnJlZXMga21hbGxvY2VkIG1lbW9yeSAtJmd0OyBhbmQgbmV2ZXIgY2FsbHMgdmZyZWUoKS4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBSeWFiaW5pbiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86YXJ5YWJpbmluQHZpcnR1b3p6by5jb20iPiZsdDthcnlhYmlu
aW5AdmlydHVvenpvLmNvbSZndDs8L2E+Ci0tLQogbW0vdXRpbC5jIHwgMiAtLQogMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vdXRpbC5jIGIvbW0vdXRpbC5j
CmluZGV4IDkyOWVkMTc5NWJjMS4uN2YxZjE2NWY0NmFmIDEwMDY0NAotLS0gYS9tbS91dGlsLmMK
KysrIGIvbW0vdXRpbC5jCkBAIC00NDYsOCArNDQ2LDYgQEAgRVhQT1JUX1NZTUJPTChrdm1hbGxv
Y19ub2RlKTsKICAqLwogdm9pZCBrdmZyZWUoY29uc3Qgdm9pZCAqYWRkcikKIHsKLQltaWdodF9z
bGVlcF9pZighaW5faW50ZXJydXB0KCkpOwotCiAJaWYgKGlzX3ZtYWxsb2NfYWRkcihhZGRyKSkK
IAkJdmZyZWUoYWRkcik7CiAJZWxzZQo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4K
ICA8L2JvZHk+CjwvaHRtbD4K

--===============7317909195382983478==--

