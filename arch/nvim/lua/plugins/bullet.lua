return {
  'dkarter/bullets.vim',
  ft = { 'markdown', 'text', 'gitcommit', 'scratch' },
  keys = {
     { '<M-c>', '<Plug>(bullets-toggle-checkbox)', mode = { 'n', 'v' }, desc = 'Toggle checkbox' },
     { '<CR>', '<Plug>(bullets-newline)', mode = 'i', desc = 'New bullet point' },
     { '<Tab>', '<Plug>(bullets-demote)', mode = 'i', desc = 'Indent bullet' },
     { '<S-Tab>', '<Plug>(bullets-promote)', mode = 'i', desc = 'Outdent bullet' },
   },
}
